//
//  TicketListTable.m
//  CustomTabBar
//
//  Created by Andrey Pushenko on 8/3/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "TicketListTable.h"
#import "TicketCell.h"

@interface TicketListTable()
@property (strong, nonatomic) NSArray *tableArray;
@end

@implementation TicketListTable
@synthesize ticketTableView;
@synthesize tableArray;
@synthesize headerTable;


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.tableArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *kTicketCellIdentifier = @"TicketCell";
        
    TicketCell *cell = [tableView dequeueReusableCellWithIdentifier:kTicketCellIdentifier];
    NSDictionary *dictionaryInfo = [tableArray objectAtIndex:indexPath.row];
    cell.cellInfoDictionary = dictionaryInfo;    
        
    return cell;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

- (void)loadData {
    
   
  
    NSDictionary *cellInfo = [NSDictionary dictionaryWithObjectsAndKeys:
                              @"ticket1", @"ticket", 
                              @"description example", @"description", 
                              @"http://aizol.com.ua/templates/theme21/images/newsizol.jpg", @"image", 
                              @"topRow.png", @"backgroundImage",
                              nil];
    
    NSDictionary *cellInfo1 = [NSDictionary dictionaryWithObjectsAndKeys:@"ticket6", @"ticket", 
                               @"description example1", @"description", 
                               @"http://aizol.com.ua/templates/theme21/images/newsizol.jpg", @"image", 
                               @"middleRow.png", @"backgroundImage",
                               nil]; 
    NSDictionary *cellInfo2 = [NSDictionary dictionaryWithObjectsAndKeys:@"ticket2", @"ticket", 
                               @"description example2", @"description", 
                               @"http://aizol.com.ua/templates/theme21/images/newsizol.jpg", @"image", 
                               @"middleRow.png", @"backgroundImage",
                               nil]; 
    NSDictionary *cellInfo3 = [NSDictionary dictionaryWithObjectsAndKeys:@"ticket3", @"ticket", 
                               @"description example3", @"description", 
                               @"http://aizol.com.ua/templates/theme21/images/newsizol.jpg", @"image", 
                               @"middleRow.png", @"backgroundImage",
                               nil];
    NSDictionary *cellInfo4 = [NSDictionary dictionaryWithObjectsAndKeys:@"ticket4", @"ticket", 
                               @"description example4", @"description", 
                               @"http://aizol.com.ua/templates/theme21/images/newsizol.jpg", @"image", 
                               @"middleRow.png", @"backgroundImage",
                               nil]; 
    NSDictionary *cellInfo5 = [NSDictionary dictionaryWithObjectsAndKeys:@"ticket5", @"ticket", 
                               @"description example5", @"description", 
                               @"http://aizol.com.ua/templates/theme21/images/newsizol.jpg", @"image", 
                               @"bottomRow.png", @"backgroundImage",
                               nil]; 
    
    self.tableArray = [NSArray arrayWithObjects:cellInfo, cellInfo1, cellInfo2, cellInfo3, cellInfo4, cellInfo5, nil];
    [ticketTableView reloadData];
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.headerTable.text = @"Ticket's list";
    [self loadData];  
    
}


- (void)viewDidUnload
{
    
    [self setTicketTableView:nil];
    [super viewDidUnload];   
    // Release any retained subviews of the main view.i
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


@end
