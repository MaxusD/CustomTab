//
//  CustomTabBarSecondViewController.h
//  CustomTabBar
//
//  Created by Andrey Pushenko on 6/27/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTabBarSecondViewController : UIViewController<UITableViewDelegate, UITableViewDataSource> {
    UITableView *tableView;
    NSArray *list;
}

@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) NSArray *list;

@end
