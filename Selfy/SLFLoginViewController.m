//
//  SLFLoginViewController.m
//  Selfy
//
//  Created by Savitha Reddy on 4/22/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "SLFLoginViewController.h"
#import "SLFTableViewController.h"
#import <Parse/Parse.h>

@interface SLFLoginViewController ()

@end

@implementation SLFLoginViewController
{
    UIImageView *loginImage;
    UILabel *loginHeader;
    UILabel *usernameTitle;
    UITextField *userName;
    UILabel *passwordTitle;
    UITextField *password;
    UIButton *submitButton;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        loginImage = [[UIImageView alloc] initWithFrame:CGRectMake(120, 130, 30, 30)];
        loginImage.image = [UIImage imageNamed:@"Avatar.png"];
        [self.view addSubview:loginImage];
        
        loginHeader = [[UILabel alloc] initWithFrame:CGRectMake(160, 130, 70, 30)];
        loginHeader.text = @"SELFY";
        loginHeader.textColor = [UIColor whiteColor];
        loginHeader.font = [UIFont fontWithName:@"Helvetica Neue" size:15];
        [self.view addSubview:loginHeader];
        
        usernameTitle = [[UILabel alloc]initWithFrame:CGRectMake(80, 180, 100, 20)];
        usernameTitle.backgroundColor = [UIColor lightGrayColor];
        userName.autocapitalizationType = NO;
        usernameTitle.text = @"Username :";
        [self.view addSubview:usernameTitle];
        
        userName = [[UITextField alloc]initWithFrame:CGRectMake(80, 210, 200, 30)];
        userName.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:userName];
        
        passwordTitle = [[UILabel alloc]initWithFrame:CGRectMake(80, 250, 100, 20)];
        passwordTitle.backgroundColor = [UIColor lightGrayColor];
        passwordTitle.text = @"Password :";
        [self.view addSubview:passwordTitle];
        
        password = [[UITextField alloc]initWithFrame:CGRectMake(80, 280, 200, 30)];
        password.backgroundColor = [UIColor whiteColor];
        password.secureTextEntry = YES;
        [self.view addSubview:password];
        
        submitButton = [[UIButton alloc] initWithFrame:CGRectMake(130, 330, 70, 30)];
        submitButton.backgroundColor = [UIColor blackColor];
        [submitButton setTitle:@"SUBMIT" forState:UIControlStateNormal];
        [submitButton addTarget:self action:@selector(pressSubmit) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:submitButton];

    }
    return self;
}

-(void) pressSubmit
{
    
//    SLFTableViewController *viewController1 = [[SLFTableViewController alloc] initWithStyle:UITableViewStylePlain];
//    [self.navigationController pushViewController:viewController1 animated:YES];
//       userName.text = @"";
//    password.text = @"";
//    [userName resignFirstResponder];
//    [password resignFirstResponder];
    
    UIView *alertCircle = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width+50, self.view.frame.size.height-40)];
    alertCircle.backgroundColor = [UIColor grayColor];
    alertCircle.alpha = 0.4;
    [self.view addSubview:alertCircle];
    UIActivityIndicatorView *loginCircle = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    // loginCircle setColor:[UIColor orangeColor];
    loginCircle.color = [UIColor redColor];
    loginCircle.center = alertCircle.center;
    [ loginCircle startAnimating];
    [alertCircle addSubview:loginCircle];
    
    PFUser *user = [PFUser currentUser];
    user.username = userName.text;
    user.password = password.text; //any value for password
    
    userName.text = nil;
    password.text= nil;
    [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if(error == nil)
        {
            self.navigationController.navigationBarHidden = NO;
            [alertCircle removeFromSuperview];
            self.navigationController.viewControllers = @[[[SLFTableViewController alloc] initWithStyle:UITableViewStylePlain
                                                           ]];
        }else{
            //error.userInfo[@"error"];
            [alertCircle removeFromSuperview];
            NSString *errorInfo = error.userInfo[@"error"];
            // NSLog(@"%@", error.userInfo);
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ERROR" message: errorInfo
                                                           delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [alert show];
            //[self.view addSubview:alert];
        }

    
        }];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
}

-(BOOL) prefersStatusBarHidden
{
    return YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
