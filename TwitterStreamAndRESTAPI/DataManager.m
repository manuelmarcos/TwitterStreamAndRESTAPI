//
//  DataManager.m
//  TwitterStreamAndRESTAPI
//
//  Created by Manuel Marcos Regalado on 19/08/2016.
//  Copyright © 2016 Manuel Marcos Regalado. All rights reserved.
//

#import "DataManager.h"
#import "NetworkManager.h"
#import "NetworkManager+RESTAPI.h"
#import "NetworkManager+StreamAPI.h"
#import "Constants.h"
#import "Utils.h"

@interface DataManager ()

@property (nonatomic, strong) NSMutableArray *tweetsArray;

@end

@implementation DataManager

#pragma mark - Network methods

- (void)loadTweetsForKeyword:(NSString *)keyword success:(void (^)())success failure:(void (^)())failure {
    NSLog(@"getTweetsForKeyword:");
    __weak __typeof(self) weakSelf = self;
    [[NetworkManager sharedNetworkManager] getSearchTweetsForKeyword:keyword numberOfTweets:kNumberOfTweets success:^(NSArray *tweetsArray) {
        NSLog(@"getSearchTweetsForKeywordSuccess");
        __typeof(self) strongSelf = weakSelf;
        [strongSelf startStreamingTweetsForKeyword:keyword];
        NSArray *textTweetArray = [tweetsArray valueForKey:kDictionaryKeyTweetJSON];
        strongSelf.tweetsArray = [textTweetArray mutableCopy];
        // TODO: Notify updates
        if (success != nil) {
            success();
        }
    } failure:^(NSError *error) {
        NSLog(@"getSearchTweetsForKeywordFailure");
        [[Utils getTopmostViewController] presentErrorAlert:error.localizedDescription];
        if (failure != nil) {
            failure();
        }
    }];
}

- (void)startStreamingTweetsForKeyword:(NSString *)keyword {
    NSLog(@"startStreamingTweetsForKeyword");
    [[NetworkManager sharedNetworkManager] startStreamingTweetsForKeyword:keyword];
}

- (void)cancelAllTasks {
    [[NetworkManager sharedNetworkManager] stopStreaming];
}

#pragma mark - Share Manager

+ (instancetype)sharedDataManager {
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [self new];
    });
    return instance;
}

@end
