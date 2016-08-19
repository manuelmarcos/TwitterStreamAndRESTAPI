//
//  NSMutableArray+TweetsArray.h
//  TwitterStreamAndRESTAPI
//
//  Created by Manuel Marcos Regalado on 19/08/2016.
//  Copyright © 2016 Manuel Marcos Regalado. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (TweetsArray)

/**
 *  Inserts a new tweet into the Array. It pushes the new tweet at the front of the array and removes the last tweet as we are limited to 5 tweets.
 *
 *  @param newTweet The new tweet to be added/
 */
- (void)insertNewTweet:(NSString *)newTweet;

@end
