//
//  AppDelegate.m
//  TwitterStreamAndRESTAPI
//
//  Created by Manuel Marcos Regalado on 18/08/2016.
//  Copyright © 2016 Manuel Marcos Regalado. All rights reserved.
//

#import "AppDelegate.h"
#import "DataManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [[DataManager sharedDataManager] cancelAllTasks];
}

@end
