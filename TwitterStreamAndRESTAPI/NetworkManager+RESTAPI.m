//
//  NetworkManager+RESTAPI.m
//  TwitterStreamAndRESTAPI
//
//  Created by Manuel Marcos Regalado on 19/08/2016.
//  Copyright © 2016 Manuel Marcos Regalado. All rights reserved.
//

#import "NetworkManager+RESTAPI.h"
#import "NetworkManager+ForSubclassEyesOnly.h"

@implementation NetworkManager (RESTAPI)

- (void)getSearchTweetsForKeyword:(NSString *)keyword numberOfTweets:(NSInteger)numberOfTweets success:(void (^)(NSArray *tweetsArray))success failure:(void (^)(NSError *error))failure {
    __weak __typeof(self) weakSelf = self;
    [self isNetworkAvailable:^(NSError *error) {
        if (error == nil) {
            __typeof(self) strongSelf = weakSelf;
            [strongSelf.twitterClient getSearchTweetsWithQuery:keyword geocode:nil lang:nil locale:nil resultType:nil count:[@(numberOfTweets) stringValue] until:nil sinceID:nil maxID:nil includeEntities:@(YES) callback:nil successBlock:^(NSDictionary *searchMetadata, NSArray *statuses) {
                NSLog(@"getSearchTweetsWithQuerySuccess %lu", (unsigned long)statuses.count);
                success(statuses);
            } errorBlock:^(NSError *error) {
                NSLog(@"getSearchTweetsWithQueryFailure");
                failure(error);
            }];
        } else {
            failure(error);
        }
    }];
}

@end
