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

//- (void)setSelected:(BOOL)selected animated:(BOOL)animated
//{
//    [super setSelected:selected animated:animated];
//  //  self.selectionStyle = UITableViewCellSelectionStyleGray;
//    UIView *viewSelected = [UIView new];
//    viewSelected.backgroundColor = [UIColor whiteColor];
//    self.selectedBackgroundView = viewSelected;   
//   
//}

//- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
//    if (highlighted) {
//        self.backImageView.image = [UIImage imageNamed:@"middleRowSelected.png"];
//    } else {
//        self.textLabel.textColor = [UIColor blackColor];
//    }
//    [super setHighlighted:highlighted animated:animated];
//}

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
