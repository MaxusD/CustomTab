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
@synthesize registerTableView;


#pragma mark - Connection and load data

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
      
//        CGSize sizeRow = self.interestsTextView.textSize;
//        CGRect frame = self.interestsTextView.frame;
//        frame.size.height = sizeRow.height;
//        self.interestsTextView.frame = frame;
//        [self.interestsTextView sizeToFit];
//        self.tableView.rowHeight = sizeRow.height;
//        NSIndexPath *indexPath= [NSIndexPath indexPathForRow:[self.tableView numberOfRowsInSection:0] inSection:0];
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
        self.tabBarController.selectedIndex = 0;
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

- (IBAction)textFieldDoneEditing:(id)sender {
    [sender resignFirstResponder];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
   [textField resignFirstResponder];
   [self jumpToNextTextField:textField];    
    return YES;
}



#pragma mark - Button's actions
//-(IBAction)sendToServer:(id)sender {
//AFHTTPClient *httpClient = [[AFHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:@"http://aizol-coma0e.1gb.ua/webmail"]];     
//NSDictionary *parameter = {@"username":self.nameTextField.text, @"password":self.surnameTextField.text};
//[httpClient setParameterEncoding:AFJSONParameterEncoding];
//[httpClient registerHTTPOperationClass:[AFJSONRequestOperation class]];
//
//[httpClient postPath:@"api/v1/user/login/" parameters:parameter success:^(AFHTTPRequestOperation *operation, id responseObject) {
//    // Print the response body in text
//    BOOL *success = [[responseObject objectForKey:@"success"] boolValue];
//    NSLog(@"Response: %@",responseObject);
//} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//    [self handleConnectionError:error];
//}];
//}



#pragma mark - TableView Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    [super tableView:tableView heightForRowAtIndexPath:indexPath];
    CGFloat height = 87;   
    
    if (indexPath.row == 4) { 
        CGSize sizeRow = self.interestsTextView.textSize;
        CGRect frame = self.interestsTextView.frame;
        frame.size.height = self.interestsTextView.contentSize.height;
        self.interestsTextView.frame = frame;
        return sizeRow.height+150;        
    }
    return height;
}



#pragma mark - TextView Delegate

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    NSIndexPath* indexPath = [NSIndexPath indexPathForRow:4 inSection:0];
    [registerTableView scrollToRowAtIndexPath:indexPath
                             atScrollPosition:UITableViewScrollPositionTop
                                     animated:YES];
    
    return YES;
}


-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text { 
    if ([text isEqualToString:@"\n"]) { 
        [textView resignFirstResponder]; 
    } 
    return YES; 
} 

- (void)textViewDidChange:(UITextView *)textView{
}



#pragma mark - TextField Delegate

- (IBAction)editingDidBegin:(id)sender {
    NSLog(@"editingDidBegin");
    
    if (sender == nameTextField) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        
        [registerTableView scrollToRowAtIndexPath:indexPath
                                 atScrollPosition:UITableViewScrollPositionTop
                                         animated:YES];
        
    }else if (sender == surnameTextField) {
        NSIndexPath* indexPath = [NSIndexPath indexPathForRow:1 inSection:0];
        
        [registerTableView scrollToRowAtIndexPath:indexPath
                                 atScrollPosition:UITableViewScrollPositionTop
                                         animated:YES];
        
    }else if (sender == emailTextField) {
        NSIndexPath* indexPath = [NSIndexPath indexPathForRow:2 inSection:0];
        
        [registerTableView scrollToRowAtIndexPath:indexPath
                                 atScrollPosition:UITableViewScrollPositionTop
                                         animated:YES];
    }else if (sender == passwordTextField) {
        NSIndexPath* indexPath = [NSIndexPath indexPathForRow:3 inSection:0];
       
        [registerTableView scrollToRowAtIndexPath:indexPath
                                 atScrollPosition:UITableViewScrollPositionTop
                                         animated:YES];        
    }
    
}

#pragma mark - View lifecycle

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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
