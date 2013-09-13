//
//  CustomTabBarRegisterScreen.m
//  CustomTabBar
//
//  Created by Max on 8/15/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "CustomTabBarRegisterViewController.h"
#import "AFHTTPClient.h"
#import "AFJSONRequestOperation.h"

@implementation CustomTabBarRegisterViewController
@synthesize saveButton;
@synthesize emailTextField;
@synthesize surnameTextField;
@synthesize nameTextField;
@synthesize passwordTextField;
@synthesize interestsTextView;
@synthesize jsonResponse;

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle


- (void)loadData {    
    NSURL *url = [[NSURL alloc] initWithString:@"http://aizol-coma0e.1gb.ua/webmail/user/profile?id=10&token=4UkzmQ6dSUbTTGa"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url]; 
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON){
        self.jsonResponse = [JSON valueForKey:@"User"];            
        NSDictionary *info = (NSDictionary *) JSON;
        
        self.emailTextField.text = [info valueForKeyPath:@"User.email"];
        self.nameTextField.text = [info valueForKeyPath:@"User.nameUser"];
        self.surnameTextField.text = [info valueForKeyPath:@"User.login"];
        self.passwordTextField.text = [info valueForKeyPath:@"User.password"];
        self.interestsTextView.text = [info valueForKeyPath:@"User.interests"];
        CGSize sizeRow = self.interestsTextView.textSize;
        [self.interestsTextView sizeToFit];
        self.tableView.rowHeight = sizeRow.height;
//        NSIndexPath *indexPath= [NSIndexPath indexPathForRow:[self.tableView numberOfRowsInSection:0] inSection:0];
        [self.tableView reloadData];
//        [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
        
        
    }failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Sorry, exeption from load data", @"AlertView") 
        message:NSLocalizedString(@"Data haven't receive", @"AlertView") 
        delegate:self 
        cancelButtonTitle:NSLocalizedString(@"Cancel", @"AlertView") 
        otherButtonTitles:NSLocalizedString(@"Try again", @"AlertView"), nil]; 
        [alertView show];
        
    }];
    [operation start]; 
}

-(BOOL)reachable {
    Reachability *reach = [Reachability reachabilityWithHostName:@"aizol-coma0e.1gb.ua/webmail/"];
    NetworkStatus internetStatus = [reach currentReachabilityStatus];
    if(internetStatus == NotReachable) {
        return NO;
    }
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    return YES;
}


-(void)checkForConnection {
    if (![self reachable]) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"No internet connection!", @"AlertView") 
        message:NSLocalizedString(@"You haven't internet connection. Please connect to network", @"AlertView") 
        delegate:self 
        cancelButtonTitle:NSLocalizedString(@"OK", @"AlertView") 
        otherButtonTitles:NSLocalizedString(@"Go", @"AlertView"), nil]; 
        [alertView show];
    }
    else {        
        [self loadData];
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    }
}


- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs:root=WIFI"]];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];        
}

- (void)viewDidUnload {    
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self checkForConnection];    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

- (void)dealloc {
    [self setNameTextField:nil];
    [self setSurnameTextField:nil];
    [self setEmailTextField:nil];
    [self setSaveButton:nil];
    [self setPasswordTextField:nil];
    [self setInterestsTextView:nil];
    [self setJsonResponse:nil];
    [super dealloc];
}


@end
