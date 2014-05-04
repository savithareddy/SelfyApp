//
//  SLFFilterViewController.h
//  Selfy
//
//  Created by Savitha Reddy on 5/3/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SLFFilterViewControllerDelegate;

@interface SLFFilterViewController : UIViewController

@property (nonatomic,assign) id<SLFFilterViewControllerDelegate> delegate;

@property (nonatomic) UIImage *imageToFilter;


@end

@protocol SLFFilterViewControllerDelegate <NSObject>

-(void) updateCurrentImageWithFilteredImage:(UIImage *)image;

@end

