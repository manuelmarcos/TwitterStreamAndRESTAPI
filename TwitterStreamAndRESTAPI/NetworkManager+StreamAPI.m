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
    [self isNetworkAvailable:^(NSError *error) {
        if (error == nil) {
            self.streamRequest = [self.twitterClient postStatusesFilterUserIDs:nil keywordsToTrack:@[keyword] locationBoundingBoxes:nil stallWarnings:[NSNumber numberWithInt:0] progressBlock:^(NSDictionary *json, STTwitterStreamJSONType type) {
                NSLog(@"progressBlock:");
                // TODO: handle tweets
            } errorBlock:^(NSError *error) {
                // TODO: Error
            }];
        } else {
            // TODO: Error
        }
    }];
}

- (void)stopStreaming {
    // TODO: test this
    [self.streamRequest cancel];
}

@end
