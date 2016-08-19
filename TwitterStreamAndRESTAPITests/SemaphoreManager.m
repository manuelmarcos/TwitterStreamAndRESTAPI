//
//  SemaphoreManager.m
//  TwitterStreamAndRESTAPI
//
//  Created by Manuel Marcos Regalado on 19/08/2016.
//  Copyright © 2016 Manuel Marcos Regalado. All rights reserved.
//

#import "SemaphoreManager.h"

@interface SemaphoreManager ()

@property (nonatomic, strong) NSMutableDictionary *flags;

@end

@implementation SemaphoreManager

#pragma mark - Creation / Destruction Methods

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _flags = [NSMutableDictionary new];
    }
    return self;
}

- (void)dealloc
{
    _flags = nil;
}

#pragma mark - Public Methods

- (BOOL)isLifted:(NSString *)key
{
    return (_flags[key] != nil);
}

- (void)lift:(NSString *)key
{
    _flags[key] = @"YES";
}

- (void)waitForKey:(NSString *)key
{
    // Clear the key if its already been set
    if (_flags[key])
    {
        [_flags removeObjectForKey:key];
    }
    
    // Run until the key has been lifted
    BOOL run = YES;
    while (run && [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate dateWithTimeIntervalSinceNow:1.0f]])
    {
        run = !([self isLifted:key]);
    }
}

#pragma mark - Static Methods

+ (SemaphoreManager *)sharedManager
{
    static SemaphoreManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [self new];
    });
    return instance;
}

@end
