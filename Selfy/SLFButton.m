//
//  SLFButton.m
//  Selfy
//
//  Created by Savitha Reddy on 4/29/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "SLFButton.h"

@implementation SLFButton
{
    UIButton *settingButton;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        

    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClearRect(context, rect);
    CGContextSetLineWidth(context, 2.0);
    
    [[UIColor blueColor]set];
    CGContextSetLineCap(context, kCGLineCapRound);

    
    CGContextMoveToPoint(context, 1, 1);
    CGContextAddLineToPoint(context, 19, 1);
    
    CGContextMoveToPoint(context, 1, 10);
    CGContextAddLineToPoint(context, 19, 10);
    
    CGContextMoveToPoint(context, 1, 19);
    CGContextAddLineToPoint(context, 19, 19);
    
    CGContextStrokePath(context);

}


@end
