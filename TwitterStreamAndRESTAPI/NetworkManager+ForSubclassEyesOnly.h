//
//  NetworkManager+ForSubclassEyesOnly.h
//  TwitterStreamAndRESTAPI
//
//  Created by Manuel Marcos Regalado on 19/08/2016.
//  Copyright © 2016 Manuel Marcos Regalado. All rights reserved.
//

#import "NetworkManager.h"
#import "STTwitter.h"

/**
 *  Private properties and methods to be used in other NetworkManager categories
 *  are defined here as well as common methods. Properties need to be declared
 *  as dynamic in order to be used in other categories.
 */
@interface NetworkManager (ForSubclassEyesOnly)

@property (nonatomic, strong) STTwitterAPI *twitterClient;
@property (nonatomic, strong) NSObject<STTwitterRequestProtocol> *streamRequest;

@end
