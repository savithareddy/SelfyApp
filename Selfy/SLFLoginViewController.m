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
    UIButton *signinButton;
    UILabel * orTitle;
    UIView *signForm;
    UIView *signinForm;
    UITextField *displayName;
    UILabel *displayNameTitle;
    UITextField *signinuserName;
    UILabel *signinuserNameTitle;
    UITextField *signinPassword;
    UILabel *signinPasswordTitle;
    UITextField *signinReenterPassword;
    UILabel *signinReenterPasswordTitle;
    UITextField *signinEmail;
    UILabel *signinEmailTitle;
    UIImageView *signinAvatar;
    UILabel *signinAvatarTitle;
    UIButton *submitButtonSignin;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        signForm = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,self.view.frame.size.height)];
        signForm.backgroundColor = [UIColor clearColor];
        [self.view addSubview:signForm];

        loginImage = [[UIImageView alloc] initWithFrame:CGRectMake(120, 130, 30, 30)];
        loginImage.image = [UIImage imageNamed:@"Avatar.png"];
        [signForm addSubview:loginImage];
        
        loginHeader = [[UILabel alloc] initWithFrame:CGRectMake(160, 130, 70, 30)];
        loginHeader.text = @"SELFY";
        loginHeader.textColor = [UIColor whiteColor];
        loginHeader.font = [UIFont fontWithName:@"Helvetica Neue" size:15];
        [signForm  addSubview:loginHeader];
        
        usernameTitle = [[UILabel alloc]initWithFrame:CGRectMake(80, 180, 100, 20)];
        usernameTitle.backgroundColor = [UIColor lightGrayColor];
        userName.autocapitalizationType = NO;
        usernameTitle.text = @"Username :";
        [signForm addSubview:usernameTitle];
        
        userName = [[UITextField alloc]initWithFrame:CGRectMake(80, 210, 200, 30)];
        userName.backgroundColor = [UIColor whiteColor];
        [signForm addSubview:userName];
        
        passwordTitle = [[UILabel alloc]initWithFrame:CGRectMake(80, 250, 100, 20)];
        passwordTitle.backgroundColor = [UIColor lightGrayColor];
        passwordTitle.text = @"Password :";
        [signForm addSubview:passwordTitle];
        
        password = [[UITextField alloc]initWithFrame:CGRectMake(80, 280, 200, 30)];
        password.backgroundColor = [UIColor whiteColor];
        password.secureTextEntry = YES;
        [signForm addSubview:password];
        
        submitButton = [[UIButton alloc] initWithFrame:CGRectMake(80, 330, 200, 30)];
        submitButton.backgroundColor = [UIColor blueColor];
        submitButton.layer.cornerRadius = 15;
        [submitButton setTitle:@"SignIn" forState:UIControlStateNormal];
        [submitButton addTarget:self action:@selector(pressSubmit) forControlEvents:UIControlEventTouchUpInside];
        [signForm addSubview:submitButton];
        
        orTitle = [[UILabel alloc] initWithFrame:CGRectMake(130, 370, 100, 30)];
        orTitle.text = @"Not Registered Yet ? ";
        orTitle.textColor = [UIColor blackColor];
        orTitle.font = [UIFont fontWithName:@"Helvetica Neue" size:10];
        [signForm addSubview:orTitle];
        
        signinButton = [[UIButton alloc] initWithFrame:CGRectMake(80, 410, 200, 30)];
        signinButton.backgroundColor = [UIColor blueColor];
        signinButton.layer.cornerRadius = 15;
        [signinButton setTitle:@"SignUp" forState:UIControlStateNormal];
        [signinButton addTarget:self action:@selector(pressSignin) forControlEvents:UIControlEventTouchUpInside];
        [signForm addSubview:signinButton];
        
        signinForm = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,self.view.frame.size.height)];
        signinForm.backgroundColor = [UIColor clearColor];
       
        
        displayName = [[UITextField alloc]initWithFrame:CGRectMake(60, 100, 220, 30)];
        displayName.placeholder = @"Display Name: ";
        displayName.textColor = [UIColor lightGrayColor];
        displayName.backgroundColor = [UIColor whiteColor];
        [signinForm addSubview:displayName];
        
//        displayNameTitle = [[UILabel alloc]initWithFrame:CGRectMake(60, 80, 220, 20)];
//        [displayNameTitle setText:@"Display Name: "];
//        displayNameTitle.textColor = [UIColor grayColor];
//        displayNameTitle.backgroundColor = [UIColor clearColor];
//        [signinForm addSubview:displayNameTitle];
        
        signinuserName = [[UITextField alloc]initWithFrame:CGRectMake(60, 140, 220, 30)];
        signinuserName.backgroundColor = [UIColor whiteColor];
        signinuserName.placeholder = @"User Name: ";
        signinuserName.textColor = [UIColor lightGrayColor];
        [signinForm addSubview:signinuserName];
        
//        signinuserNameTitle = [[UILabel alloc]initWithFrame:CGRectMake(60, 120, 220, 20)];
//        [signinuserNameTitle setText:@"User Name : "];
//        signinuserNameTitle.textColor = [UIColor lightGrayColor];
//        signinuserNameTitle.backgroundColor = [UIColor clearColor];
//        [signinForm addSubview:signinuserNameTitle];
        
        signinPassword = [[UITextField alloc]initWithFrame:CGRectMake(60, 180, 220, 30)];
        signinPassword.backgroundColor = [UIColor whiteColor];
        //signinPassword.secureTextEntry = YES;
        signinPassword.placeholder = @"Password: ";
        signinPassword.textColor = [UIColor lightGrayColor];
        [signinForm addSubview:signinPassword];
        
//        signinPasswordTitle = [[UILabel alloc]initWithFrame:CGRectMake(60, 180, 220, 30)];
//        [signinPasswordTitle setText:@"Password: "];
//        signinPasswordTitle.textColor = [UIColor lightGrayColor];
//        signinPasswordTitle.backgroundColor = [UIColor clearColor];
//        [signinForm addSubview:signinPasswordTitle];
        
        signinReenterPassword = [[UITextField alloc]initWithFrame:CGRectMake(60, 220, 220, 30)];
        signinReenterPassword.backgroundColor = [UIColor whiteColor];
        signinReenterPassword.secureTextEntry = YES;
        signinReenterPassword.placeholder = @"Re-enter Password: ";
        signinReenterPassword.textColor = [UIColor lightGrayColor];
        [signinForm addSubview:signinReenterPassword];
        
//        signinReenterPasswordTitle = [[UILabel alloc]initWithFrame:CGRectMake(60, 220, 220, 30)];
//        [signinReenterPasswordTitle setText:@"Re-enter Password"];
//        signinReenterPasswordTitle.textColor = [UIColor lightGrayColor];
//        signinReenterPasswordTitle.backgroundColor = [UIColor clearColor];
//        [signinForm addSubview:signinReenterPasswordTitle];
        
        signinEmail = [[UITextField alloc]initWithFrame:CGRectMake(60, 260, 220, 30)];
        signinEmail.backgroundColor = [UIColor whiteColor];
        signinEmail.placeholder = @"E-mail: ";
        signinEmail.textColor = [UIColor lightGrayColor];
        [signinForm addSubview:signinEmail];
        
//        signinEmailTitle = [[UILabel alloc]initWithFrame:CGRectMake(60, 260, 220, 30)];
//        [signinEmailTitle setText:@"E-mail "];
//        signinEmailTitle.textColor = [UIColor lightGrayColor];
//        signinEmailTitle.backgroundColor = [UIColor clearColor];
//        [signinForm addSubview:signinEmailTitle];
        
        signinAvatar = [[UIImageView alloc]initWithFrame:CGRectMake(60, 300, 220, 30)];
        signinAvatar.backgroundColor = [UIColor whiteColor];
        [signinForm addSubview:signinAvatar];
        
//        signinAvatarTitle = [[UILabel alloc]initWithFrame:CGRectMake(60, 300, 220, 30)];
//        [signinAvatarTitle setText:@"Choose Your Avatar"];
//        signinAvatarTitle.textColor = [UIColor lightGrayColor];
//        signinAvatarTitle.backgroundColor = [UIColor clearColor];
//        [signinForm addSubview:signinAvatarTitle];
        
        submitButtonSignin = [[UIButton alloc] initWithFrame:CGRectMake(90, 340, 150, 30)];
        submitButtonSignin.backgroundColor = [UIColor blueColor];
        submitButtonSignin.layer.cornerRadius = 15;
        [submitButtonSignin setTitle:@"Register" forState:UIControlStateNormal];
        [submitButtonSignin addTarget:self action:@selector(pressRegister) forControlEvents:UIControlEventTouchUpInside];
        [signinForm addSubview:submitButtonSignin];

        
        
    }
    return self;
}

-(void) pressSignin
{
    [signForm removeFromSuperview];
    
    [UIView animateWithDuration:0.4 animations:^{
        
        [self.view addSubview:signinForm];
    }];

}
-(void) pressRegister
{
    [signinForm removeFromSuperview];
    [UIView animateWithDuration:0.4 animations:^{
        
        [self.view addSubview:signForm];
    }];

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

//-(BOOL) prefersStatusBarHidden
//{
//    return YES;
//}

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
