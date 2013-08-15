//
//  CustomTabBarRegisterScreen.m
//  CustomTabBar
//
//  Created by Max on 8/15/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "CustomTabBarRegisterScreen.h"

@implementation CustomTabBarRegisterScreen
@synthesize emailTextField;
@synthesize surnameTextField;
@synthesize nameTextField;

- (void)viewDidUnload {
    [self setNameTextField:nil];
    [self setSurnameTextField:nil];
    [self setEmailTextField:nil];
    [super viewDidUnload];
}
@end
