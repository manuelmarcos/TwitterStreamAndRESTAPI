//
//  NetworkManager.m
//  TwitterStreamAndRESTAPI
//
//  Created by Manuel Marcos Regalado on 19/08/2016.
//  Copyright © 2016 Manuel Marcos Regalado. All rights reserved.
//

#import "NetworkManager.h"
#import "Reachability.h"
#import "Constants.h"
#import "Utils.h"

@interface NetworkManager ()

@property (nonatomic) Reachability *hostReachability;

@end

@implementation NetworkManager

#pragma mark - Init

- (instancetype)init {
    self = [super init];
    if (self) {
        _online = NO;
                
        // Init reachability for the first time and start monitoring
        self.hostReachability = [Reachability reachabilityWithHostName:kTwitterAPIHostEndPoint];
        [self updateReachability:self.hostReachability.currentReachabilityStatus];
        [self.hostReachability startNotifier];
        
    }
    return self;
}

#pragma mark - Connectivity

// Called by Reachability whenever status changes.
- (void)reachabilityChanged:(NSNotification *)note {
    Reachability* curReach = [note object];
    NSParameterAssert([curReach isKindOfClass:[Reachability class]]);
    [self updateReachability:curReach.currentReachabilityStatus];
}

- (void)updateReachability:(NetworkStatus)netStatus {
    switch (netStatus) {
        case ReachableViaWiFi:
            _online = YES;
            break;
        case ReachableViaWWAN:
            _online = YES;
            break;
        default:
            _online = NO;
            break;
    }
}

- (void)isNetworkAvailable:(CompletionErrorBlock)completionBlock {
    if ([self isOnline]) {
       // TODO:
    } else {
        NSError *error = [NSError errorWithDomain:kNetworkErrorDomain code:-1004 userInfo:[NSDictionary dictionaryWithObject:NSLocalizedString(@"Error Localized Description host not reachable", @"Host not reachable") forKey:NSLocalizedDescriptionKey]];
        completionBlock(error);
    }
}

#pragma mark - Share Manager

+ (instancetype)sharedNetworkManager {
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [self new];
    });
    return instance;
}

@end
