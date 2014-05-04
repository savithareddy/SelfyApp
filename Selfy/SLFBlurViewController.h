//
//  SLFBlurViewController.h
//  Selfy
//
//  Created by Savitha Reddy on 5/3/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//
#import <UIKit/UIKit.h>

@protocol SLFBlurViewControllerDelegate;

@interface SLFBlurViewController : UIViewController

@property (nonatomic,assign) id<SLFBlurViewControllerDelegate> delegate;

@property(nonatomic) UIImage * imageToFilter;

@end

@protocol SLFBlurViewControllerDelegate <NSObject>

-(void)updateCurrentImageWithFilteredImage:(UIImage *)image;

@end
