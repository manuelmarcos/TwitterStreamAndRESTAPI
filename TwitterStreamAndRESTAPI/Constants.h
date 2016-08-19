//
//  Constants.h
//  TwitterStreamAndRESTAPI
//
//  Created by Manuel Marcos Regalado on 19/08/2016.
//  Copyright © 2016 Manuel Marcos Regalado. All rights reserved.
//

// Error domain
static NSString *const kNetworkErrorDomain = @"uk.co.twitterStreamAndRESTAPI.networkError";
static const NSInteger kStatusCodeErrorDomain = -1004;

// Host
static NSString *const kTwitterAPIHostEndPoint = @"api.twitter.com";

// Twitter App credentials
static NSString *const kTwitterOAuthConsumerKey = @"g8VzKDuCYukLaoT9VhUeMBWtZ";
static NSString *const kTwitterOAuthConsumeSecret = @"iUw4StdDOsLVTNyY2fdQlAFKSgH3pknILbFk0EjVtNz6ldXgjC";
static NSString *const kTwitterOAuthToken = @"251087026-97lKxwMr8KpV52S1G785N0aLx8ySljlGyhGgysdF";
static NSString *const kTwitterOAuthTokenSecret = @"dMgqvg8ggXVwURORwMDlEiJVaDnbtFusIG3ElyQNQj6eV";

// Number of tweets.
static const NSInteger kNumberOfTweets = 5;

// JSON parse
static NSString *const kDictionaryKeyTweetJSON = @"text";

// Notifications
static NSString *const kNotificationUpdateTweets = @"uk.co.twitterStreamAndRESTAPI.notificationUpdateTweets";
