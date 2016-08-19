//
//  NetworkManager+StreamAPI.m
//  TwitterStreamAndRESTAPI
//
//  Created by Manuel Marcos Regalado on 19/08/2016.
//  Copyright © 2016 Manuel Marcos Regalado. All rights reserved.
//

#import "NetworkManager+StreamAPI.h"
#import "NetworkManager+ForSubclassEyesOnly.h"
#import "Constants.h"
#import "Utils.h"

@implementation NetworkManager (StreamAPI)

- (void)startStreamingTweetsForKeyword:(NSString *)keyword {
    NSLog(@"startStreamingTweetsForKeyword:");
    __weak __typeof(self) weakSelf = self;
    [self isNetworkAvailable:^(NSError *error) {
        if (error == nil) {
            __typeof(self) strongSelf = weakSelf;
            strongSelf.streamRequest = [strongSelf.twitterClient postStatusesFilterUserIDs:nil keywordsToTrack:@[keyword] locationBoundingBoxes:nil stallWarnings:[NSNumber numberWithInt:0] progressBlock:^(NSDictionary *json, STTwitterStreamJSONType type) {
                NSLog(@"progressBlock:");
                [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationStreamTweet object:json];
            } errorBlock:^(NSError *error) {
                [[Utils getTopmostViewController] presentErrorAlert:error.localizedDescription];
            }];
        } else {
            [[Utils getTopmostViewController] presentErrorAlert:error.localizedDescription];
        }
    }];
}

- (void)stopStreaming {
    // TODO: test this
    [self.streamRequest cancel];
}

@end
