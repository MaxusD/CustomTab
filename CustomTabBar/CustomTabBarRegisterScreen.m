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
<<<<<<< HEAD
#import "AFHTTPClient.h"
#import "AFJSONRequestOperation.h"
=======
>>>>>>> 5c7764dd99dd2b57d2b25426eab69dab287ae356
>>>>>>> 9a7d637069d9815d419205c619dd3f58dd588da2

@implementation CustomTabBarRegisterScreen
@synthesize saveButton;
@synthesize emailTextField;
@synthesize surnameTextField;
@synthesize nameTextField;
<<<<<<< HEAD
@synthesize passwordTextField;
@synthesize interestsTextView;
@synthesize jsonResponse;
=======
<<<<<<< HEAD
@synthesize jsonResponse;
@synthesize users;
=======
>>>>>>> 5c7764dd99dd2b57d2b25426eab69dab287ae356
>>>>>>> 9a7d637069d9815d419205c619dd3f58dd588da2

//- (void)viewDidUnload {    
//    [super viewDidUnload];
//}

<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 9a7d637069d9815d419205c619dd3f58dd588da2
- (void)viewDidLoad {
    NSURL *url = [[NSURL alloc] initWithString:@"http://aizol-coma0e.1gb.ua/webmail/user/profile?id=10&token=4UkzmQ6dSUbTTGa"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url]; 
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON){
<<<<<<< HEAD
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

=======
        self.jsonResponse = JSON;   
        NSLog(@"User: %@", self.jsonResponse);
    }failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        NSLog(@"Request Failed with Error: %@, %@", error, error.userInfo);
    }];
    [operation start];
    
    
}

=======
>>>>>>> 5c7764dd99dd2b57d2b25426eab69dab287ae356
>>>>>>> 9a7d637069d9815d419205c619dd3f58dd588da2
- (void)dealloc {
    [self setNameTextField:nil];
    [self setSurnameTextField:nil];
    [self setEmailTextField:nil];
    [self setSaveButton:nil];
<<<<<<< HEAD
    [self setPasswordTextField:nil];
    [self setInterestsTextView:nil];
    [self setJsonResponse:nil];
=======
<<<<<<< HEAD
    [self jsonResponse:nil];
    [self users:nil];
=======
>>>>>>> 5c7764dd99dd2b57d2b25426eab69dab287ae356
>>>>>>> 9a7d637069d9815d419205c619dd3f58dd588da2
    [super dealloc];
}


@end
