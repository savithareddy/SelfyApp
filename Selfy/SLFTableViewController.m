//
//  SLFTableViewController.m
//  Selfy
//
//  Created by Savitha Reddy on 4/21/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "SLFTableViewController.h"
#import "SLFTableViewCell.h"
#import "SLFPhotoViewController.h"
#import "SLFNewNavigationController.h"
#import <Parse/Parse.h>
#import "SLFSettingsButton.h"
#import "SLFSettingsViewController.h"

@interface SLFTableViewController ()

@end

@implementation SLFTableViewController
{
    NSArray *selfies; // changing mutable to array since while parsing we r nor adding to the array but resettting only
    SLFSettingsButton *settingsButtonView;
    SLFSettingsViewController * settingsVC;
    
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
//        selfies = [@[
//                    @{
//                        @"image" : @" ",
//                        @"caption" : @"This is a selfy",
//                        @"user_id" : @"",
//                        @"avatar" : @"",
//                        @"selfy_id" : @""
//                        }
//                   ]mutableCopy];
//        selfies = @[
//                     @{
//                                              
//                     @"image" : @"http://1.bp.blogspot.com/-S4MUYSjsw4E/Tb9wsgCVegI/AAAAAAAAAjg/fOhEnXh4_0U/s1600/IMG_3535.JPG",
//                     @"caption" : @"Awesome!",
//                     @"user_id" : @"savitha",
//                    @"avatar" : @"https://pbs.twimg.com/profile_images/454415266986725376/PPLXLSSx.png",
//                    @"selfy_id" : @"hjk2l32bn1"
//                                                                                              
//                        }
//                                                               
//                ] ;
        //[self refreshSelfies];
        
//        PFObject *testObject = [PFObject objectWithClassName:@"user"];
//        testObject[@"name"] = @"savitha";
//        [testObject saveInBackground];
//
//        PFUser *user = [PFUser currentUser];
//        user.username = @"savitha";
//        user.password = @"pass"; //any value for password
//        [user saveInBackground];

        UIBarButtonItem *addNewSelfyButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(openNewSelfy)];
        self.navigationItem.rightBarButtonItem = addNewSelfyButton;
        
        settingsButtonView = [[SLFSettingsButton alloc] initWithFrame:CGRectMake(0, 0, 20, 20)]; //the button size is standard 20*20 is in apple document for UIBarButtonItem Class Ref.
        settingsButtonView.tintColor  = [UIColor blueColor];
        settingsButtonView.toggleTintColor = [UIColor redColor];
        [settingsButtonView addTarget:self action:@selector(openSettings) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *settingsButton = [[UIBarButtonItem alloc]initWithCustomView:settingsButtonView];
        self.navigationItem.leftBarButtonItem = settingsButton;
       
         
        self.tableView.rowHeight = self.tableView.frame.size.width-40;
        
        
    }
    return self;
}
-(void)openSettings
{
    [settingsButtonView toggle]; // calling the method declared in SLFSettingsButton.h
    
   // settingsButtonView.toggled = ![settingsButtonView isToggled]; //is declared in the toggle method in .h file instead do the above
    
    int X = [settingsButtonView isToggled] ? SCREEN_WIDTH-52 : 0; //if toggled move to width of 270 else 0
//    int X=0; // other way to represent the above
//    if ([settingsButtonView isToggled]) {
//        X=SCREEN_WIDTH-50;
//    }
    [UIView animateWithDuration:0.3 delay:0.0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.navigationController.view.frame = CGRectMake(X, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    } completion:^(BOOL finished) {
        if (![settingsButtonView isToggled]) {
            [settingsVC.view removeFromSuperview];
        }
    }];

    if ([settingsButtonView isToggled]) {
        if(settingsVC==nil) settingsVC = [[SLFSettingsViewController alloc]initWithNibName:nil bundle:nil];
        settingsVC.view.frame = CGRectMake(52-SCREEN_WIDTH, 0, SCREEN_WIDTH-52, SCREEN_HEIGHT);
        [self.navigationController.view addSubview:settingsVC.view];
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];

}

-(void) viewWillAppear:(BOOL)animated
{
    [self refreshSelfies]; //this whole method is used to reload the data to the table biew
    
}

-(void)openNewSelfy
{
    //self.navigationController.navigationBarHidden = NO;
//    self.navigationController.viewControllers = @[[[SLFPhotoViewController alloc] initWithNibName:nil bundle:nil]];
   // self.navigationController.navigationBar.barTintColor = [UIColor blueColor];
    //self.navigationController.navigationBar.translucent = NO;
    SLFPhotoViewController *viewController2 = [[SLFPhotoViewController alloc]initWithNibName:nil bundle:nil];
//    UINavigationController *navController2 = [[UINavigationController alloc]initWithRootViewController:viewController2];
    SLFNewNavigationController *nc = [[SLFNewNavigationController alloc]initWithRootViewController:viewController2];
    nc.navigationBar.barTintColor = [UIColor blueColor];
//   // nc.navigationBar.translucent = NO;
//    //[self.navigationController pushViewController:viewController2 animated:YES];
//    //    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    [self.navigationController  presentViewController:nc animated:YES completion:^{
      
    }];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    PFQuery *query =[PFQuery queryWithClassName:@"UserSelfy"]; // should be placed here to know how many times to query
//    selfies= [query findObjects]; //blocks the main thread therefore use in background
   // NSLog(@"%@",selfies);
        return [selfies count];
}

-(void) refreshSelfies
{
    PFQuery *query =[PFQuery queryWithClassName:@"UserSelfy"];
  // selfies= [query findObjects]; // this does task only sync...//blocks the main thread therefore use in background
    //[query findObjectsInBackgroundWithTarget:self selector:@selector(callbackWithResult:error:)];
    
    //Change Order by created date : newest first
    [query orderByDescending:@"createdAt"];
    
    //after user connected to selfy :
    //used a pointer "PArent " to do this
    
    //filter only your user's selfies
    [query whereKey:@"parent" equalTo:[PFUser currentUser]];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        selfies = objects;
        [self.tableView reloadData];
    }];
    
}

//-(void) callbackWithResult:(NSArray *)result error:(NSError *)error
//{
//    // not reuired here // can work with the block method above
//}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
     SLFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        
        cell = [[ SLFTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.selfyInfo = selfies[indexPath.row];
    
    
    
    return cell;
    
}

//-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    
//    
//
//}



@end
