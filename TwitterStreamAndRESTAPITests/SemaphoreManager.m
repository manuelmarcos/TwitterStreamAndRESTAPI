//
//  SemaphoreManager.m
//  TwitterStreamAndRESTAPI
//
//  Created by Manuel Marcos Regalado on 19/08/2016.
//  Copyright © 2016 Manuel Marcos Regalado. All rights reserved.
//


@import Foundation;

/// Used in our TestSuite to run tests on asynchronous calls

@interface SemaphoreManager : NSObject

/// The shared instance
+ (SemaphoreManager *)sharedManager;

/// Checks if a key has been lifted
- (BOOL)isLifted:(NSString *)key;
/// Lifts a specific key
- (void)lift:(NSString *)key;
/// Sets a key that is waiting to be lifted
- (void)waitForKey:(NSString *)key;

@end
