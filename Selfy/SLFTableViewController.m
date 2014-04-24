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
//#import <Parse/Parse.h>

@interface SLFTableViewController ()

@end

@implementation SLFTableViewController
{
    UIView *header;
    UILabel *nameLabel;
    UIButton *settingButton;
    UIButton *addButton;
    NSArray *selfies;
    
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
        selfies = [@[
                     @{
                                              
                     @"image" : @"http://1.bp.blogspot.com/-S4MUYSjsw4E/Tb9wsgCVegI/AAAAAAAAAjg/fOhEnXh4_0U/s1600/IMG_3535.JPG",
                     @"caption" : @"Awesome!",
                     @"user_id" : @"savitha",
                    @"avatar" : @"https://pbs.twimg.com/profile_images/454415266986725376/PPLXLSSx.png",
                    @"selfy_id" : @"hjk2l32bn1"
                                                                                              
                        }
                                                               
                ] mutableCopy];
        
//        PFObject *testObject = [PFObject objectWithClassName:@"user"];
//        testObject[@"name"] = @"savitha";
//        [testObject saveInBackground];
//        
//        PFUser *user = [PFUser currentUser];
//        user.username = @"savitha";
//        user.password = @"pass"; //any value for password
//        [user saveInBackground];
        
       
         
    self.tableView.rowHeight = self.tableView.frame.size.width+100;
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    header.backgroundColor = [UIColor lightGrayColor];
    header.alpha = 0.8;
    [self.view addSubview:header];
    
    nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(130, 10, 60, 30)];
    nameLabel.text = @"SELFY";
    nameLabel.textColor = [UIColor blackColor];
    nameLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:15];
    [self.view addSubview:nameLabel];
    
    settingButton = [[UIButton alloc]initWithFrame:CGRectMake(20, 10, 30, 30)];
    settingButton.backgroundColor = [UIColor blackColor];
    [settingButton setTitle:@" S " forState:UIControlStateNormal];
    [settingButton addTarget:self action:@selector(pressSetting) forControlEvents:UIControlEventTouchUpInside];
    settingButton.layer.cornerRadius = 15;
    [self.view addSubview:settingButton];
    
    addButton = [[UIButton alloc]initWithFrame:CGRectMake(270, 10, 30, 30)];
    addButton.backgroundColor = [UIColor blackColor];
    addButton.layer.cornerRadius = 15;
    [addButton setTitle:@" + " forState:UIControlStateNormal];
    [addButton addTarget:self action:@selector(pressAdd) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addButton];
    
}

-(void) pressSetting
{
    
}
-(void) pressAdd
{
    SLFCameraViewController *viewController2 = [[SLFCameraViewController alloc]initWithNibName:nil bundle:nil];
    //UINavigationController *navController2 = [[UINavigationController alloc]initWithRootViewController:viewController2];
    [self.navigationController pushViewController:viewController2 animated:YES];
//    self.navigationItem.leftBarButtonItem = self.editButtonItem;

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [selfies count];
}


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


-(BOOL) prefersStatusBarHidden
{
    return YES;
}

@end
