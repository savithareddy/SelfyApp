//
//  SLFNavController.h
//  Selfy
//
//  Created by Savitha Reddy on 4/24/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SLFLoginViewController;

@interface SLFNavController : UINavigationController

-(void) addLoginViewController:(SLFLoginViewController *)viewController;

@end
