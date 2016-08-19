//
//  Utils.h
//  TwitterStreamAndRESTAPI
//
//  Created by Manuel Marcos Regalado on 19/08/2016.
//  Copyright © 2016 Manuel Marcos Regalado. All rights reserved.
//

@import Foundation;
@import UIKit;

typedef void (^CompletionErrorBlock)(NSError *error);

@interface Utils : NSObject

/**
 *  Get the current top most view controller of the App
 *
 *  @return The UIViewController that is at the top.
 */
+ (UIViewController *)getTopmostViewController;

@end
