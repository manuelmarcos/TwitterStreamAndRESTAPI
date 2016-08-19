//
//  UIViewController+ErrorAlert.h
//  TwitterStreamAndRESTAPI
//
//  Created by Manuel Marcos Regalado on 19/08/2016.
//  Copyright © 2016 Manuel Marcos Regalado. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ErrorAlert)

/**
 *  Present an error alert with a given error message. It only has the option/action of dismiss it itself.
 *
 *  @param errorMessage The error message to be displayed
 */
- (void)presentErrorAlert:(NSString *)errorMessage;

@end
