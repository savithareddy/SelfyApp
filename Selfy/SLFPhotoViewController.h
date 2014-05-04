//
//  SLFPhotoViewController.h
//  Selfy
//
//  Created by Savitha Reddy on 5/3/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SLFPhotoViewControllerDelegate;

@interface SLFPhotoViewController : UIViewController

@property (nonatomic,assign) id<SLFPhotoViewControllerDelegate> delegate;

@property (nonatomic) UIImage *imageToFilter;


@end

@protocol SLFPhotoViewControllerDelegate <NSObject>

-(void) updateCurrentImageWithFilteredImage:(UIImage *)image;

@end

