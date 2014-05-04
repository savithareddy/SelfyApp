//
//  SLFControlsViewController.h
//  Selfy
//
//  Created by Savitha Reddy on 5/3/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SLFControlsViewControllerDelegate;

@interface SLFControlsViewController : UIViewController

@property (nonatomic,assign) id<SLFControlsViewControllerDelegate> delegate;

@end

@protocol SLFControlsViewControllerDelegate <NSObject>

-(void) selectFilter;
-(void) selectHsb;
-(void) selectBlur;

@end
