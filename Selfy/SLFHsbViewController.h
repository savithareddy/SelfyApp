//
//  SLFHsbViewController.h
//  Selfy
//
//  Created by Savitha Reddy on 5/3/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SLFHsbViewControllerDelegate;

@interface SLFHsbViewController : UIViewController

@property (nonatomic) UIImage* currentImage;

@property (nonatomic) id <SLFHsbViewControllerDelegate> delegate;

@end

@protocol SLFHsbViewControllerDelegate <NSObject>;

- (void)updateCurrentImageWithFilteredImage: (UIImage * )image;

@end
