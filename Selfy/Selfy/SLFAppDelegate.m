//
//  SLFAppDelegate.m
//  Selfy
//
//  Created by Savitha Reddy on 4/21/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "SLFAppDelegate.h"
#import "SLFNavController.h"
//#import "SLFTableViewController.h"//single files are with quotaions
#import "SLFLoginViewController.h"
//#import "SLFCameraViewController.h"
#import <Parse/Parse.h> // external / internal framework are with <>

@implementation SLFAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
 [Parse setApplicationId:@"H1JHLiA7kFRmIWvtbkHDcnA1Caj4UofHxRx6UZAB"
            clientKey:@"dKLyXccYHUy1MXNgrdR2Sq5b1fNQoTr4clSXVd3p"];
[PFUser enableAutomaticUser];
   // SLFLoginViewController *rootViewController = [[SLFLoginViewController alloc] initWithNibName:nil bundle:nil];
   // UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:rootViewController];
  //  self.window.rootViewController = navController;
    
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[[SLFLoginViewController alloc] initWithNibName:nil bundle:nil]];
    self.window.rootViewController = nav;
    nav.navigationBarHidden = YES;
    
//    [nav addLoginViewController: [[SLFLoginViewController alloc] initWithNibName:nil bundle:nil]];
   //[nav addTableViewController: [[SLFTableViewController alloc] initWithStyle:UITableViewStylePlain];
   // [nav addCameraViewController: [[SLFCameraViewController alloc] initWithStyle:UITableViewStylePlain];
    
    //self.window.rootViewController = [[SLFTableViewController alloc]initWithStyle:(UITableViewStylePlain)];
    //self.window.rootViewController = [[SLFLoginViewController alloc]initWithNibName:nil bundle:nil];
   //self.window.rootViewController = [[SLFCameraViewController alloc]initWithNibName:nil bundle:nil];
    self.window.backgroundColor = [UIColor lightGrayColor];
   // self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}


@end


