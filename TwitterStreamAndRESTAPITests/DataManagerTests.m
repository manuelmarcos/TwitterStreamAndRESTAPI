//
//  DataManagerTests.m
//  TwitterStreamAndRESTAPI
//
//  Created by Manuel Marcos Regalado on 19/08/2016.
//  Copyright © 2016 Manuel Marcos Regalado. All rights reserved.
//

@import XCTest;

#import "DataManager.h"
#import "SemaphoreManager.h"

static NSString *const kSemaphoreKeyGetTweets = @"semaphoreKeyGetTweets";

@interface DataManagerTest : XCTestCase

@property (nonatomic, strong) DataManager *dataManager;

@end

@implementation DataManagerTest

- (void)setUp
{
    [super setUp];
    
    _dataManager = [DataManager new];
}

- (void)testLoadingTweetsForKeyword
{
    __block BOOL responseSuccess = NO;
    [_dataManager loadTweetsForKeyword:@"Spain" success:^{
        [[SemaphoreManager sharedManager] lift:kSemaphoreKeyGetTweets];
        responseSuccess = YES;
    } failure:^{
        [[SemaphoreManager sharedManager] lift:kSemaphoreKeyGetTweets];
    }];
    [[SemaphoreManager sharedManager] waitForKey:kSemaphoreKeyGetTweets];
    XCTAssertTrue(responseSuccess);
}

@end
