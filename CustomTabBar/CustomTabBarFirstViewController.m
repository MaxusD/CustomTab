//
//  CustomTabBarFirstViewController.m
//  CustomTabBar
//
//  Created by Andrey Pushenko on 6/27/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "CustomTabBarFirstViewController.h"
#import "UIImageView+AFNetworking.h"

@implementation CustomTabBarFirstViewController
@synthesize headerImage;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
//	[[self view] setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"master_bg.png"]]]; 
    [headerImage setImageWithURL: [NSURL URLWithString:@"http://aizol.com.ua/images/stories/gallery/polyuretan2.jpg"] placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
