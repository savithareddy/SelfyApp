//
//  SLFTableViewController.m
//  Selfy
//
//  Created by Savitha Reddy on 4/21/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "SLFTableViewController.h"
#import "SLFTableViewCell.h"
#import "SLFCameraViewController.h"
#import "SLFNewNavigationController.h"
#import <Parse/Parse.h>
#import "SLFButton.h"
#import "SLFButton1.h"
#import "SLFSettingViewController.h"

@interface SLFTableViewController ()

@end

@implementation SLFTableViewController
{
    SLFButton *toggleView;
//    UIView *header;
//    UILabel *nameLabel;
//    UIButton *settingButton;
//    UIButton *addButton;
    NSArray *selfies; // changing mutable to array since while parsing we r nor adding to the array but resettting only
    UIButton *settingButton;
    UIButton *cancelButton;
    
    
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
        
        settingButton = [[SLFButton alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
       [settingButton addTarget:self action:@selector(toggleSettings) forControlEvents:UIControlEventTouchUpInside];
        
        
        UIBarButtonItem *settingSelfyButton = [[UIBarButtonItem alloc]initWithCustomView:settingButton];
        self.navigationItem.leftBarButtonItem = settingSelfyButton;
        
        
       
         
 self.tableView.rowHeight = self.tableView.frame.size.width-40;
        
        
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    [self toggleSettings];
  //  [self.view addSubview:toggleView];
    
//    header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
//    header.backgroundColor = [UIColor lightGrayColor];
//    header.alpha = 0.8;
//    [self.view addSubview:header];
//    
//    nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(130, 10, 60, 30)];
//    nameLabel.text = @"SELFY";
//    nameLabel.textColor = [UIColor blackColor];
//    nameLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:15];
//    [self.view addSubview:nameLabel];
//    
//    settingButton = [[UIButton alloc]initWithFrame:CGRectMake(20, 10, 30, 30)];
//    settingButton.backgroundColor = [UIColor blackColor];
//    [settingButton setTitle:@" S " forState:UIControlStateNormal];
//    [settingButton addTarget:self action:@selector(pressSubmit) forControlEvents:UIControlEventTouchUpInside];
//    settingButton.layer.cornerRadius = 15;
//    [self.view addSubview:settingButton];
//    
//    addButton = [[UIButton alloc]initWithFrame:CGRectMake(270, 10, 30, 30)];
//    addButton.backgroundColor = [UIColor blackColor];
//    addButton.layer.cornerRadius = 15;
//    [addButton setTitle:@" + " forState:UIControlStateNormal];
//    [addButton addTarget:self action:@selector(pressAdd) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:addButton];
    
}




-(void) toggleSettings
{
//    if (<#condition#>) {
//        <#statements#>
//    }
    [UIView animateWithDuration:0.75 animations:^{
        self.navigationController.view.frame  = CGRectMake(SCREEN_WIDTH-50, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        self.navigationItem.
        self.navigationItem.rightBarButtonItem = cancelButton;
        UIViewController *snc = [[SLFSettingViewController alloc] initWithNibName:nil bundle:nil];
        snc.view.frame = CGRectMake(-270, 0, 270, SCREEN_HEIGHT);
        
        //settingButton = [[SLFButton1 alloc] initWithFrame:self.view.frame];
    }];
    
       // UINavigationController *toggleControl = [[UINavigationController alloc] initWithRootViewController:snc];
        //[self.navigationController.view addSubview:snc.view];
       // toggleView = [[SLFButton1 alloc] initWithFrame:self.view.frame];
}


-(void) viewWillAppear:(BOOL)animated
{
    [self refreshSelfies]; //this whole method is used to reload the data to the table biew
    
}

-(void) pressSubmit
{
    
}
-(void)openNewSelfy
{
//    SLFCameraViewController *viewController2 = [[SLFCameraViewController alloc]initWithNibName:nil bundle:nil];
//    //UINavigationController *navController2 = [[UINavigationController alloc]initWithRootViewController:viewController2];
//    SLFNewNavigationController *nc = [[SLFNewNavigationController alloc]initWithRootViewController:viewController2];
//    nc.navigationBar.barTintColor = [UIColor blueColor];
//    nc.navigationBar.translucent = NO;
//    //[self.navigationController pushViewController:viewController2 animated:YES];
////    self.navigationItem.leftBarButtonItem = self.editButtonItem;
//    [self.navigationController  presentViewController:nc animated:YES completion:^{
//        
//    }];
    

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


@end
