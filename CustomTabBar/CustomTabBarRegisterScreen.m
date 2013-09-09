//
//  CustomTabBarRegisterScreen.m
//  CustomTabBar
//
//  Created by Max on 8/15/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "CustomTabBarRegisterScreen.h"
#import "AFHTTPClient.h"
#import "AFJSONRequestOperation.h"

@implementation CustomTabBarRegisterScreen
@synthesize saveButton;
@synthesize emailTextField;
@synthesize surnameTextField;
@synthesize nameTextField;
@synthesize passwordTextField;
@synthesize interestsTextView;
@synthesize jsonResponse;

//- (void)viewDidUnload {    
//    [super viewDidUnload];
//}

- (void)viewDidLoad {
    NSURL *url = [[NSURL alloc] initWithString:@"http://aizol-coma0e.1gb.ua/webmail/user/profile?id=10&token=4UkzmQ6dSUbTTGa"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url]; 
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON){
        self.jsonResponse = [JSON valueForKey:@"User"];   
        NSLog(@"User: %@", self.jsonResponse);      
        NSDictionary *info = (NSDictionary *) JSON;
              
        self.emailTextField.text = [info valueForKeyPath:@"User.email"];
        self.nameTextField.text = [info valueForKeyPath:@"User.nameUser"];
        self.surnameTextField.text = [info valueForKeyPath:@"User.login"];
        self.passwordTextField.text = [info valueForKeyPath:@"User.password"];
       // self.interestsTextView.text = [info valueForKeyPath:@"User.interests"];
        NSLog(@"Email: %@", [JSON valueForKeyPath:@"User.email"]);
        
    }failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        NSLog(@"Request Failed with Error: %@, %@", error, error.userInfo);
    }];
    [operation start];   
    
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
