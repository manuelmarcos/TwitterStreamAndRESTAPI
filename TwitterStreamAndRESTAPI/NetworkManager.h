//
//  NetworkManager.h
//  TwitterStreamAndRESTAPI
//
//  Created by Manuel Marcos Regalado on 19/08/2016.
//  Copyright © 2016 Manuel Marcos Regalado. All rights reserved.
//

@import Foundation;
#import "Utils.h"

@interface NetworkManager : NSObject

@property (nonatomic, getter = isOnline, readonly) BOOL online;

/**
 *  Determines whether the network is available or not. The network is available if the host is reachable and the credentials are verified.
 *
 *  @param completionBlock Returns an error if the network in not available. Otherwise, the error should be nil.
 */
- (void)isNetworkAvailable:(CompletionErrorBlock)completionBlock;

/**
 *  Shared Manager
 *
 *  @return returns an instance of the Manager
 */
+ (instancetype)sharedNetworkManager;

@end
