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
@synthesize scrollView;
@synthesize jsonResponse;

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle


- (void)loadData {    
    NSURL *url = [[NSURL alloc] initWithString:@"http://aizol-coma0e.1gb.ua/webmail/user/profile?id=10&token=4UkzmQ6dSUbTTGa"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url]; 
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON){
        self.jsonResponse = [JSON valueForKey:@"User"];            
        NSDictionary *info = (NSDictionary *) JSON;
        
        self.emailTextField.text = [info valueForKeyPath:@"User.email"];
        self.nameTextField.text = [info valueForKeyPath:@"User.nameUser"];
        self.surnameTextField.text = [info valueForKeyPath:@"User.login"];
        self.passwordTextField.text = [info valueForKeyPath:@"User.password"];
        self.interestsTextView.text = [info valueForKeyPath:@"User.interests"];
        CGSize sizeRow = self.interestsTextView.textSize;
        CGRect frame = self.interestsTextView.frame;
        frame.size.height = sizeRow.height;
        self.interestsTextView.frame = frame;
        [self.interestsTextView sizeToFit];
        self.tableView.rowHeight = sizeRow.height;
        NSIndexPath *indexPath= [NSIndexPath indexPathForRow:[self.tableView numberOfRowsInSection:0] inSection:0];
//        
//        [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];        
        [self.tableView reloadData];
        
        
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
    Reachability *reach = [Reachability reachabilityWithHostName:@"google.com"];
    NetworkStatus internetStatus = [reach currentReachabilityStatus];
    if(internetStatus == NotReachable) {
        return NO;
    }    
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

- (void)jumpToNextTextField:(UITextField*)textField {
     if (textField == self.nameTextField) {        
        [self.surnameTextField becomeFirstResponder];
        NSLog(@"textField == %@", textField);
    }else if (textField == self.surnameTextField) {        
        [self.emailTextField becomeFirstResponder];
    }else if (textField == self.emailTextField) {
        [self.passwordTextField becomeFirstResponder];        
    }else if (textField == self.passwordTextField) {
        [self.interestsTextView becomeFirstResponder];
    }
}

//- (IBAction)textFieldDoneEditing:(id)sender {
//    [sender resignFirstResponder];
//}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
   [textField resignFirstResponder];
   [self jumpToNextTextField:textField];
    NSLog(@"textField == %@", textField);
    return YES;
}




//- (void)textViewDidChange:(UITextView *)textView{
//    CGRect rect = textView.frame;
//    CGRect backRc = self.interestsTextView.frame;
//    rect.size.height = textView.contentSize.height;
//    backRc.size.height = textView.contentSize.height;
//    
//    if (backRc.size.height < 51) {
//        backRc.size.height = 51;
//    }
//    
//    textView.frame = rect;
//    _registerContentView.descriptionBackgroundImageView.frame = backRc;
//    CGRect rc = _viewFrame;
//    rc.size.height += backRc.size.height - 51;
//    _registerContentView.frame = rc;
//    [self updateContentSize];
//}
#pragma mark - TextField Delegate

//- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
//    [self scrollToTextField:textField];
//    [];
//}




//- (void) scrollToTextField: (UITextField *)textField {
//    [scrollView setContentOffset:CGPointMake(0, textField.frame.origin.y - 100) animated:YES];
//}



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
