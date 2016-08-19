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

static NSString *kTweetCellReuseIdentifier = @"kTweetCellReuseIdentifier";

@interface ViewController ()

@property (nonatomic, strong) NSArray *tweetsArray;

@end

@implementation ViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateTweets:) name:kNotificationUpdateTweets object:nil];
    [self.refreshControl addTarget:self action:@selector(loadTweets) forControlEvents:UIControlEventValueChanged];
    [self loadTweets];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    self.tweetsArray = nil;
}

#pragma mark - Update UI methods

- (void)loadTweets {
    [self.refreshControl beginRefreshing];
    // TODO: Populate the keyword from a search bar
    [[DataManager sharedDataManager] loadTweetsForKeyword:@"Spain" success:nil failure:nil];
}

- (void)updateTweets:(NSNotification *)notification {
    if (self.refreshControl.isRefreshing) {
        [self.refreshControl endRefreshing];
    }
    NSArray *newTweetsArray = notification.object;
    self.tweetsArray = newTweetsArray;
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource/Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tweetsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kTweetCellReuseIdentifier];
    cell.textLabel.text = self.tweetsArray[indexPath.row];
    return cell;
}

@end
