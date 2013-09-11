//
//  UITextView+Size.m
//  LoppsClient
//
//  Created by Sasha on 5/4/13.
//  Copyright (c) 2013 Guang YANG. All rights reserved.
//

#import "UITextView+Size.h"

@implementation UITextView (Size)

- (CGSize)textSize{
    // Calculating cell height
    return [self.text sizeWithFont:self.font
                           constrainedToSize:CGSizeMake(self.frame.size.width - 20, 9999)
                               lineBreakMode:UILineBreakModeWordWrap];

}
@end
