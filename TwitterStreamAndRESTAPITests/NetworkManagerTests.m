//
//  NetworkManagerTests.m
//  TwitterStreamAndRESTAPI
//
//  Created by Manuel Marcos Regalado on 19/08/2016.
//  Copyright © 2016 Manuel Marcos Regalado. All rights reserved.
//

@import XCTest;

#import "NetworkManager.h"
#import "NetworkManager+RESTAPI.h"
#import "SemaphoreManager.h"

static NSString *const kSemaphoreKeyGetTweets = @"semaphoreKeyGetTweets";

@interface NetworkManagerTest : XCTestCase

@property (nonatomic, strong) NetworkManager *networkManager;

@end

@implementation NetworkManagerTest

- (void)setUp {
    [super setUp];
    
    _networkManager = [NetworkManager new];
}

- (void)testSuccessLoadingTweetsForKeyword
{
    __block BOOL responseSuccess = NO;
    __block NSArray *resultsArray = nil;
    [_networkManager getSearchTweetsForKeyword:@"Spain" numberOfTweets:5 success:^(NSArray *tweetsArray) {
        
        resultsArray = tweetsArray;
        responseSuccess = YES;
        [[SemaphoreManager sharedManager] lift:kSemaphoreKeyGetTweets];
    } failure:^(NSError *error) {
        [[SemaphoreManager sharedManager] lift:kSemaphoreKeyGetTweets];
    }];
    
    [[SemaphoreManager sharedManager] waitForKey:kSemaphoreKeyGetTweets];
    XCTAssertTrue(responseSuccess);
    XCTAssertNotNil(resultsArray);
}

@end
