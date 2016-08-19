//
//  DataManager.h
//  TwitterStreamAndRESTAPI
//
//  Created by Manuel Marcos Regalado on 19/08/2016.
//  Copyright © 2016 Manuel Marcos Regalado. All rights reserved.
//

@import Foundation;

@interface DataManager : NSObject

/**
 *  Loads tweets for a specific given keyword. The success and failure blocks are only for testing purposes.
 *
 *  @param keyword The given keyword
 *  @param success Only used for testing purposes
 *  @param failure Only used for testing purposes
 */
- (void)loadTweetsForKeyword:(NSString *)keyword success:(void (^)())success failure:(void (^)())failure;

/**
 *  Starts a streaming of tweets for a given keyword. This will be streaming tweets as they happen right now, live.
 *
 *  @param keyword The given keyword
 */
- (void)startStreamingTweetsForKeyword:(NSString *)keyword;

/**
 *  Cancel all tasks that the DataManager might have been running
 */
- (void)cancelAllTasks;

/**
 *  Shared Manager
 *
 *  @return returns an instance of the Manager
 */
+ (instancetype)sharedDataManager;

@end
