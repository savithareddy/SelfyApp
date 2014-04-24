//
//  SLFNavController.m
//  Selfy
//
//  Created by Savitha Reddy on 4/24/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "SLFNavController.h"
#import "SLFLoginViewController.h"

@interface SLFNavController ()

@end

@implementation SLFNavController
{
    SLFLoginViewController *LoginVC;
}

-(void)addLoginViewController:(SLFLoginViewController *)viewController
{
    LoginVC = viewController;
    [self pushViewController:viewController animated:NO];
}







- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
        
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
  // self.navigationController.navigationBarHidden = NO;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

-(BOOL) prefersStatusBarHidden
{
    return YES;
}


@end
