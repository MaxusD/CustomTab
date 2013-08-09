//
//  TicketCell.m
//  CustomTabBar
//
//  Created by Andrey Pushenko on 8/3/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "TicketCell.h"
#import "UIImageView+AFNetworking.h"

@implementation TicketCell

@synthesize backImageView;
@synthesize ticketImageView;
@synthesize descriptionTicketLabel;
@synthesize ticketLable;
@synthesize cellInfoDictionary;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected stateI
}

- (void)setCellInfoDictionary:(NSDictionary *)newCellInfoDictionary {
    cellInfoDictionary = newCellInfoDictionary;
    
    NSString *titleName = [newCellInfoDictionary objectForKey:@"ticket"];
    NSString *descriptionName = [newCellInfoDictionary objectForKey:@"description"];
    NSString *backgroundImageName = [newCellInfoDictionary objectForKey:@"backgroundImage"];
    UIImage *backgroundImage = [UIImage imageNamed:backgroundImageName];
    
    [self.ticketImageView setImageWithURL:[NSURL URLWithString:[newCellInfoDictionary objectForKey:@"image"]] placeholderImage:[UIImage imageNamed:@"ticketImage.png"]];
    
    self.ticketLable.text = titleName;
    self.descriptionTicketLabel.text = descriptionName;
    self.backImageView.image = backgroundImage;
    
}


@end
