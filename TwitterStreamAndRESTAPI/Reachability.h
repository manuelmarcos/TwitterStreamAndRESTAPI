/*
 Copyright (C) 2016 Apple Inc. All Rights Reserved.
 See LICENSE.txt for this sample’s licensing information
 
 Abstract:
 Basic demonstration of how to use the SystemConfiguration Reachablity APIs.
 */

@import Foundation;
#import <SystemConfiguration/SystemConfiguration.h>
#import <netinet/in.h>

typedef enum : NSInteger {
	NotReachable = 0,
	ReachableViaWiFi,
	ReachableViaWWAN
} NetworkStatus;

#pragma mark IPv6 Support
//Reachability fully support IPv6.  For full details, see ReadMe.md.

extern NSString *kReachabilityChangedNotification;

@interface Reachability : NSObject

/**
*  Use to check the reachability of a given host name.
*
*  @param hostName the name of the host
*
*  @return The instance
*/
+ (instancetype)reachabilityWithHostName:(NSString *)hostName;

/**
 *  Use to check the reachability of a given IP address.
 *
 *  @param hostAddress The host address to reach
 *
 *  @return The instance
 */
+ (instancetype)reachabilityWithAddress:(const struct sockaddr *)hostAddress;

/**
 *  Checks whether the default route is available. Should be used by applications that do not connect to a particular host.
 *
 *  @return The instance
 */
+ (instancetype)reachabilityForInternetConnection;

/**
 *  Start listening for reachability notifications on the current run loop.
 *
 *  @return Whether it started or not
 */
- (BOOL)startNotifier;

/**
 *  Stops listening
 */
- (void)stopNotifier;

/**
 *  Get the current reachability status
 *
 *  @return The current Network status
 */
- (NetworkStatus)currentReachabilityStatus;

/**
 *  WWAN may be available, but not active until a connection has been established. WiFi may require a connection for VPN on Demand.
 *
 *  @return Whether the connection is required or not.
 */
- (BOOL)connectionRequired;

@end
