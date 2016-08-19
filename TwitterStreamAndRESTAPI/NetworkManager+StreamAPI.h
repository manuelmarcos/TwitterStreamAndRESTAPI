//
//  NetworkManager+StreamAPI.h
//  TwitterStreamAndRESTAPI
//
//  Created by Manuel Marcos Regalado on 19/08/2016.
//  Copyright © 2016 Manuel Marcos Regalado. All rights reserved.
//

#import "NetworkManager.h"

@interface NetworkManager (StreamAPI)

/**
 *  Starts a streaming of tweets for a given keyword. This will be streaming tweets as they happen right now, live.
 *
 *  @param keyword The given keyword
 */
- (void)startStreamingTweetsForKeyword:(NSString *)keyword;

/**
 *  Stops the streaming of tweets.
 */
- (void)stopStreaming;

@end
