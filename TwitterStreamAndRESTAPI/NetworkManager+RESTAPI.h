//
//  NetworkManager+RESTAPI.h
//  TwitterStreamAndRESTAPI
//
//  Created by Manuel Marcos Regalado on 19/08/2016.
//  Copyright © 2016 Manuel Marcos Regalado. All rights reserved.
//

#import "NetworkManager.h"

@interface NetworkManager (RESTAPI)

/**
 *  Loads tweets for a specific given keyword. The success and failure blocks are only for testing purposes.
 *
 *  @param keyword        The given keyword
 *  @param numberOfTweets The limited amount of tweets that the request should return.
 *  @param success        Only used for testing purposes
 *  @param failure        Only used for testing purposes
 */
- (void)getSearchTweetsForKeyword:(NSString *)keyword numberOfTweets:(NSInteger)numberOfTweets success:(void (^)(NSArray *tweetsArray))success failure:(void (^)(NSError *error))failure;

@end
