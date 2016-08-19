//
//  Utils.m
//  TwitterStreamAndRESTAPI
//
//  Created by Manuel Marcos Regalado on 19/08/2016.
//  Copyright © 2016 Manuel Marcos Regalado. All rights reserved.
//

#import "Utils.h"

@implementation Utils

+ (UIViewController *)getTopmostViewController
{
    return [UIApplication sharedApplication].keyWindow.rootViewController;
}

@end
