//
//  SLFNewNavigationController.m
//  Selfy
//
//  Created by Savitha Reddy on 4/28/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "SLFNewNavigationController.h"

@interface SLFNewNavigationController ()

@end

@implementation SLFNewNavigationController

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
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
  
}

-(UIStatusBarStyle) preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
@end
