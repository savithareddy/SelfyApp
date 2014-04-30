//
//  SLFSettingViewController.m
//  Selfy
//
//  Created by Savitha Reddy on 4/29/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "SLFSettingViewController.h"
#import "SLFButton.h"
#import "SLFButton1.h"
#import "SLFSettingIcon.h"
#import "SLFTableViewController.h"

@interface SLFSettingViewController ()

@end

@implementation SLFSettingViewController
{
    UIButton *cancelButton;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //self.view.backgroundColor = [UIColor redColor];
        cancelButton = [[SLFButton1 alloc] initWithFrame:CGRectMake(320, 0, 20, 20)];
        cancelButton.backgroundColor = [UIColor redColor];
        [cancelButton addTarget:self action:@selector(showCancel) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *cancelSelfyButton = [[UIBarButtonItem alloc]initWithCustomView:cancelButton];
        self.navigationItem.rightBarButtonItem = cancelSelfyButton;
}
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
}

-(void) showCancel
{
    SLFTableViewController *tnc = [[SLFTableViewController alloc] initWithNibName:nil bundle:nil];
    UINavigationController *toggleback = [[UINavigationController alloc] initWithRootViewController:tnc];
    [self.navigationController.view addSubview:toggleback.view];
   // toggleView = [[SLFButton alloc] initWithFrame:self.view.frame];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   }


@end
