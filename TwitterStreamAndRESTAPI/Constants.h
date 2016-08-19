//
//  Constants.h
//  TwitterStreamAndRESTAPI
//
//  Created by Manuel Marcos Regalado on 19/08/2016.
//  Copyright © 2016 Manuel Marcos Regalado. All rights reserved.
//

// Error domain
static NSString *const kNetworkErrorDomain = @"uk.co.twitterStreamAndRESTAPI.networkError";

// Host
static NSString *const kTwitterAPIHostEndPoint = @"api.twitter.com";

// Twitter App credentials
static NSString *const kTwitterOAuthConsumerKey = @"iTzNzQJGDf7AhU3B8zfpxqWJF";
static NSString *const kTwitterOAuthConsumeSecret = @"PB4TvN25vITR4ViTLYlVNfUu2Tvv26BSXhxobyD9qcy1mdacJC";
static NSString *const kTwitterOAuthToken = @"251087026-Gg86cuBM3484PxKu3BoclnMdIjtrpfJbiVh5qNiT";
static NSString *const kTwitterOAuthTokenSecret = @"N30ZDNKR8jnrq9byZbPdfRAZTGFqzSsFAdwpkc36sbCQv";

// Number of tweets. Limited by Transferwise challenge instructions.
static const NSInteger kNumberOfTweets = 5;

// JSON parse
static NSString *const kDictionaryKeyTweetJSON = @"text";
