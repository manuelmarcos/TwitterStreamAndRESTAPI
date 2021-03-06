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
#import "NSMutableArray+TweetsArray.h"

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
        [strongSelf notifyUpdateTweets];
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
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleNewTweet:) name:kNotificationStreamTweet object:nil];
    [[NetworkManager sharedNetworkManager] startStreamingTweetsForKeyword:keyword];
}

- (void)cancelAllTasks {
    [[NetworkManager sharedNetworkManager] stopStreaming];
}

#pragma mark - Notifications

- (void)notifyUpdateTweets {
    NSLog(@"notifyUpdateTweets");
    dispatch_async(dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationUpdateTweets object:self.tweetsArray];
    });
}

#pragma mark - Helpers

- (void)handleNewTweet:(NSNotification *)notification {
    NSLog(@"handleNewTweet:");
    NSDictionary *newTweet = notification.object;
    [self.tweetsArray insertNewTweet:newTweet[kDictionaryKeyTweetJSON]];
    [self notifyUpdateTweets];
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
