//
//  CustomTabBarSecondViewController.m
//  CustomTabBar
//
//  Created by Max on 6/27/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "CustomTabBarSecondViewController.h"

@implementation CustomTabBarSecondViewController 

@synthesize tableView;
@synthesize list;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
	self.list = [NSArray arrayWithObjects:@"Example1", @"Example2", @"Example3", @"Example4", @"Example5", @"Example6", @"Example7", @"Example8", nil];
    self.tableView.rowHeight = 100;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"gradientBackground.png"]];
    
    UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 60)];
    UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, 300, 40)];
    headerLabel.text = @"Tickets' list";
    headerLabel.textAlignment = UITextAlignmentCenter;
    headerLabel.textColor = [UIColor whiteColor];
    headerLabel.shadowColor = [UIColor blackColor];
    headerLabel.shadowOffset = CGSizeMake(0, 1);
    headerLabel.font = [UIFont boldSystemFontOfSize:22];
    headerLabel.backgroundColor = [UIColor clearColor];
    [containerView addSubview:headerLabel];
    self.tableView.tableHeaderView = containerView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return list.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UILabel *topLabel;
    UILabel *bottomLabel;
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
        UIImage *indicatorImage = [UIImage imageNamed:@"indicator.png"];
        cell.accessoryView = [[UIImageView alloc] initWithImage:indicatorImage];
        
        const CGFloat LABEL_HEIGHT = 20;
        UIImage *image = [UIImage imageNamed:@"imageA.png"];
        CGRect topLabelFrame = CGRectMake(image.size.width + 2.0 * cell.indentationWidth, 
                                          0.5 * (tableView.rowHeight - 2 * LABEL_HEIGHT), 
                                          tableView.bounds.size.width - image.size.width - 
                                          4.0 * cell.indentationWidth - indicatorImage.size.width,LABEL_HEIGHT);
        topLabel = [[UILabel alloc] initWithFrame:topLabelFrame];
        [cell.contentView addSubview:topLabel];
        
        topLabel.tag = 1;
        topLabel.backgroundColor = [UIColor clearColor];
        topLabel.textColor = [UIColor colorWithRed:0.25 green:0.0 blue:0.0 alpha:1.0];
        topLabel.highlightedTextColor = [UIColor colorWithRed:1.0 green:1.0 blue:0.9 alpha:1.0];
        topLabel.font = [UIFont systemFontOfSize:[UIFont labelFontSize]];
        
        //bottom label
        CGRect bottomLabelFrame = CGRectMake(image.size.width + 2.0 * cell.indentationWidth, 
                                             0.5 * (tableView.rowHeight - 2 * LABEL_HEIGHT) + LABEL_HEIGHT, 
                                             tableView.bounds.size.width - image.size.width - 
                                             4.0 * cell.indentationWidth - indicatorImage.size.width,LABEL_HEIGHT);
        bottomLabel = [[UILabel alloc] initWithFrame:bottomLabelFrame];
        [cell.contentView addSubview:bottomLabel];
        
        bottomLabel.tag = 2;
        bottomLabel.backgroundColor = [UIColor clearColor];
        bottomLabel.textColor = [UIColor colorWithRed:0.25 green:0.0 blue:0.0 alpha:1.0];
        bottomLabel.highlightedTextColor = [UIColor colorWithRed:1.0 green:1.0 blue:0.9 alpha:1.0];
        bottomLabel.font = [UIFont systemFontOfSize:[UIFont labelFontSize]-2];
        
        cell.backgroundView = [UIImageView new];
        cell.selectedBackgroundView = [UIImageView new];
    } else {
        topLabel = (UILabel *)[cell viewWithTag:1];
        bottomLabel = (UILabel *)[cell viewWithTag:2];
    }
    
    topLabel.text = [list objectAtIndex:indexPath.row];
    bottomLabel.text = @"Tickets' list";
    
    UIImage *rowBackground;
    UIImage *selectionBackground;
    
    NSInteger sectionRows = [tableView numberOfRowsInSection:[indexPath section]];
    NSInteger row = [indexPath row];
    if (row == 0 && row == sectionRows - 1) {
        rowBackground = [UIImage imageNamed:@"topAndBottomRow.png"];
        selectionBackground = [UIImage imageNamed:@"topAndBottomRowSelected.png"];
    }
    else if (row == 0) {
        rowBackground = [UIImage imageNamed:@"topRow.png"];
        selectionBackground = [UIImage imageNamed:@"topRowSelected.png"];
    }
    else if (row == sectionRows - 1) {
        rowBackground = [UIImage imageNamed:@"bottomRow.png"];
        selectionBackground = [UIImage imageNamed:@"bottomRowSelected.png"];
    }
    else {
        rowBackground = [UIImage imageNamed:@"middleRow.png"];
        selectionBackground = [UIImage imageNamed:@"middleRowSelected.png"];
    }
    
    
    ((UIImageView *)cell.backgroundView).image = rowBackground;
    ((UIImageView *)cell.selectedBackgroundView).image = selectionBackground;
    
    if ((row % 3) == 0) {
        cell.imageView.image = [UIImage imageNamed:@"imageA.png"];
    }
    else if ((row % 3) == 1) {
        cell.imageView.image = [UIImage imageNamed:@"imageB.png"];
    }
    else {
        cell.imageView.image = [UIImage imageNamed:@"imageC.png"];
    }
    
    return cell;
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
