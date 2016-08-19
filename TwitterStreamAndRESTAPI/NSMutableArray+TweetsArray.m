//
//  NSMutableArray+TweetsArray.m
//  TwitterStreamAndRESTAPI
//
//  Created by Manuel Marcos Regalado on 19/08/2016.
//  Copyright © 2016 Manuel Marcos Regalado. All rights reserved.
//

#import "NSMutableArray+TweetsArray.h"

@implementation NSMutableArray (TweetsArray)

- (void)insertNewTweet:(NSString *)newTweet {
    [self insertObject:newTweet atIndex:0];
    if (self.count >= 5) {
        [self removeLastObject];
    }
}

@end
