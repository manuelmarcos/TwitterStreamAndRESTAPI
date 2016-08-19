//
//  ViewController.m
//  TwitterStreamAndRESTAPI
//
//  Created by Manuel Marcos Regalado on 18/08/2016.
//  Copyright © 2016 Manuel Marcos Regalado. All rights reserved.
//

#import "ViewController.h"
#import "Constants.h"
#import "DataManager.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *tweetsArray;

@end

@implementation ViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateTweets:) name:kNotificationUpdateTweets object:nil];
    [self loadTweets];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    self.tweetsArray = nil;
}

#pragma mark - Update UI methods

- (void)loadTweets {
    [self.refreshControl beginRefreshing];
    [[DataManager sharedDataManager] loadTweetsForKeyword:@"Spain" success:nil failure:nil];
}

- (void)updateTweets:(NSNotification *)notification {
    NSArray *newTweetsArray = notification.object;
    self.tweetsArray = newTweetsArray;
   // TODO: reload table view
}

@end
