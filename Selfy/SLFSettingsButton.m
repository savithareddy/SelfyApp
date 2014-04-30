//
//  SLFSettingsButton.m
//  Selfy
//
//  Created by Savitha Reddy on 4/30/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "SLFSettingsButton.h"

@implementation SLFSettingsButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}
-(void) toggle
{
    self.toggled = !self.toggled; //swapping the value
//    self.toggled = ![self isToggled]; // other ways to write the same setter and getter
//    [self setToggled:![self isToggled]];
}
-(void) setToggled:(BOOL)toggled
{
    _toggled = toggled;
    self.alpha = 0.0; // fading the view
    [self setNeedsDisplay]; // redraw the view by calling drawrect// called for views only ...
    [UIView animateWithDuration:0.3 delay:0.2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.alpha = 1.0;
    } completion:nil]; //hiding the view

}
- (void)drawRect:(CGRect)rect // rect is the self.frame
{
    float pad = 1.0;
    float w=rect.size.width-pad;
    float h=rect.size.height-pad;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 2.0);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextClearRect(context, rect);
    [self.tintColor set]; //use default tint color that is declared globally
    if ([self isToggled])
    {
        if(self.toggleTintColor != nil)
        [self.toggleTintColor set];
        CGContextMoveToPoint(context, pad, pad);
        CGContextAddLineToPoint(context, w, h);
        
        CGContextMoveToPoint(context, w,pad);
        CGContextAddLineToPoint(context, pad, h);
    }else {
//        [self.tintColor set];
    CGContextMoveToPoint(context, pad, pad);
    CGContextAddLineToPoint(context, w, pad);
    
    CGContextMoveToPoint(context, pad, h/2);
    CGContextAddLineToPoint(context, w, h/2);
    
    CGContextMoveToPoint(context, pad, h);
    CGContextAddLineToPoint(context, w, h);
    }
    CGContextStrokePath(context);
    
}


@end
