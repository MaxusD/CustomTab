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
@synthesize sellInfoDictionary;

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

    // Configure the view for the selected state
}

- (void)setSellInfoDictionary:(NSDictionary *)newSellInfoDictionary {
    sellInfoDictionary = newSellInfoDictionary;
    
    NSString *titleName = [newSellInfoDictionary objectForKey:@"ticket"];
    NSString *descriptionName = [newSellInfoDictionary objectForKey:@"description"];
    NSString *imageName = [newSellInfoDictionary objectForKey:@"image"];
    NSString *backgroundImageName = [newSellInfoDictionary objectForKey:@"backgroundImage"];
    
    UIImage *ticketImage = [UIImage imageNamed:imageName];
    UIImage *backgroundImage = [UIImage imageNamed:backgroundImageName];
    
    [self.ticketImageView setImageWithURL:[NSURL URLWithString:[newSellInfoDictionary objectForKey:@"image"]] placeholderImage:[UIImage imageNamed:@"ticketImage.png"]];
    
    self.ticketLable.text = titleName;
    self.descriptionTicketLabel.text = descriptionName;
    self.backImageView.image = backgroundImage;
}

@end
