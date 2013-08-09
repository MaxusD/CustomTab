//
//  TicketCell.h
//  CustomTabBar
//
//  Created by Andrey Pushenko on 8/3/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TicketListTable.h"

@interface TicketCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *descriptionTicketLabel;
@property (weak, nonatomic) IBOutlet UILabel *ticketLable;
@property (weak, nonatomic) IBOutlet UIImageView *ticketImageView;
@property (weak, nonatomic) IBOutlet UIImageView *backImageView;
@property (strong, nonatomic) NSDictionary *cellInfoDictionary;

@end
