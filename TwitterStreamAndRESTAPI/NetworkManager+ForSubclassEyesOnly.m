//
//  NetworkManager+ForSubclassEyesOnly.m
//  TwitterStreamAndRESTAPI
//
//  Created by Manuel Marcos Regalado on 19/08/2016.
//  Copyright © 2016 Manuel Marcos Regalado. All rights reserved.
//

@import ObjectiveC.runtime;

#import "NetworkManager+ForSubclassEyesOnly.h"

static char NetworkManagerProperty;
static char NetworkStreamRequestProperty;
static NSString *const twitterClientKey = @"twitterClient";
static NSString *const streamRequestKey = @"streamRequest";

@implementation NetworkManager (ForSubclassEyesOnly)

@dynamic twitterClient;
@dynamic streamRequest;

/// Dynamic getter / setter for the objects so we can use them in our other categories

- (void)setTwitterClient:(STTwitterAPI *)twitterClient {
    [self willChangeValueForKey:twitterClientKey];
    objc_setAssociatedObject(self, &NetworkManagerProperty, twitterClient, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:twitterClientKey];
}

- (STTwitterAPI *)twitterClient {
    return objc_getAssociatedObject(self, &NetworkManagerProperty);
}

- (void)setStreamRequest:(NSObject<STTwitterRequestProtocol> *)streamRequest {
    [self willChangeValueForKey:streamRequestKey];
    objc_setAssociatedObject(self, &NetworkStreamRequestProperty, streamRequest, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:streamRequestKey];
}

- (NSObject<STTwitterRequestProtocol> *)streamRequest {
    return objc_getAssociatedObject(self, &NetworkStreamRequestProperty);
}

@end
