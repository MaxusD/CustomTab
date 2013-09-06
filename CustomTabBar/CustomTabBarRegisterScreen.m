//
//  CustomTabBarRegisterScreen.m
//  CustomTabBar
//
//  Created by Max on 8/15/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "CustomTabBarRegisterScreen.h"
<<<<<<< HEAD
#import "AFHTTPClient.h"
#import "AFJSONRequestOperation.h"
=======
>>>>>>> 5c7764dd99dd2b57d2b25426eab69dab287ae356

@implementation CustomTabBarRegisterScreen
@synthesize saveButton;
@synthesize emailTextField;
@synthesize surnameTextField;
@synthesize nameTextField;
<<<<<<< HEAD
@synthesize jsonResponse;
@synthesize users;
=======
>>>>>>> 5c7764dd99dd2b57d2b25426eab69dab287ae356

//- (void)viewDidUnload {    
//    [super viewDidUnload];
//}

<<<<<<< HEAD
- (void)viewDidLoad {
    NSURL *url = [[NSURL alloc] initWithString:@"http://aizol-coma0e.1gb.ua/webmail/user/profile?id=10&token=4UkzmQ6dSUbTTGa"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url]; 
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON){
        self.jsonResponse = JSON;   
        NSLog(@"User: %@", self.jsonResponse);
    }failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        NSLog(@"Request Failed with Error: %@, %@", error, error.userInfo);
    }];
    [operation start];
    
    
}

=======
>>>>>>> 5c7764dd99dd2b57d2b25426eab69dab287ae356
- (void)dealloc {
    [self setNameTextField:nil];
    [self setSurnameTextField:nil];
    [self setEmailTextField:nil];
    [self setSaveButton:nil];
<<<<<<< HEAD
    [self jsonResponse:nil];
    [self users:nil];
=======
>>>>>>> 5c7764dd99dd2b57d2b25426eab69dab287ae356
    [super dealloc];
}


@end
