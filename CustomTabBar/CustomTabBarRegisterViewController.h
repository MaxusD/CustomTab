//
//  CustomTabBarRegisterScreen.h
//  CustomTabBar
//
//  Created by Max on 8/15/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Reachability.h"
#import "UITextView+Size.h"



@interface CustomTabBarRegisterViewController : UITableViewController<UITextViewDelegate, UITextFieldDelegate>

@property (retain, nonatomic) IBOutlet UIButton *saveButton;
@property (retain, nonatomic) IBOutlet UITextField *emailTextField;
@property (retain, nonatomic) IBOutlet UITextField *surnameTextField;
@property (retain, nonatomic) IBOutlet UITextField *nameTextField;
@property (retain, nonatomic) IBOutlet UITextField *passwordTextField;
@property (retain, nonatomic) IBOutlet UITextView *interestsTextView;
@property (retain, nonatomic) NSArray *jsonResponse;

@property (strong, nonatomic) IBOutlet UITableView *registerTableView;


@end
