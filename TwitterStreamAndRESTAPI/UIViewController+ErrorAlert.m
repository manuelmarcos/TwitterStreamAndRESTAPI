//
//  UIViewController+ErrorAlert.m
//  TwitterStreamAndRESTAPI
//
//  Created by Manuel Marcos Regalado on 19/08/2016.
//  Copyright © 2016 Manuel Marcos Regalado. All rights reserved.
//

#import "UIViewController+ErrorAlert.h"

@implementation UIViewController (ErrorAlert)

- (void)presentErrorAlert:(NSString *)errorMessage {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"Title error", @"Title error")
                                                                   message:errorMessage
                                                            preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"Ok", @"Ok")
                                              style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
                                                  [self dismissViewControllerAnimated:YES completion:nil];
                                              }]];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
