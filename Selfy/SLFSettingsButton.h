//
//  SLFSettingsButton.h
//  Selfy
//
//  Created by Savitha Reddy on 4/30/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SLFSettingsButton : UIButton

@property (nonatomic, getter = isToggled) BOOL toggled;
@property (nonatomic) UIColor *toggleTintColor;
-(void) toggle;


@end
