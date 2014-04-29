//
//  SLFSignUpViewController.m
//  Selfy
//
//  Created by Savitha Reddy on 4/29/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "SLFSignUpViewController.h"
#import <Parse/Parse.h>
#import "SLFTableViewController.h"

@interface SLFSignUpViewController () <UITextFieldDelegate>

@end

@implementation SLFSignUpViewController
{
    
    UIView *signinForm;
    UIImageView *signinAvatar;
    NSArray *fieldNames;
    NSMutableArray *fields;
    float signinOrigY;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.view.backgroundColor=[UIColor whiteColor];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
        [self.view addGestureRecognizer:tap];

    
    }
    return self;
}


-(void) viewWillAppear:(BOOL)animated
{
    
    UIBarButtonItem *cancelSignUpButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelSignUp)];
    cancelSignUpButton.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem =cancelSignUpButton;
    
    signinOrigY = (self.view.frame.size.height -240)/2;
    
    signinForm = [[UIView alloc] initWithFrame:CGRectMake(20, signinOrigY, 280,240)];
    [self.view addSubview:signinForm];
    
    fieldNames = @[@"UserName", @"Password", @"Display Name", @"Email"];
    fields = [@[] mutableCopy];
    for (NSString *name in fieldNames)
    {
        //index will = 0,1,2,3
        NSInteger index = [fieldNames indexOfObject:name];
        UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(0, index * 50, 280, 40)];
        textField.backgroundColor = [UIColor colorWithWhite:0.95 alpha:0.5];
        textField.layer.cornerRadius = 6;
        textField.placeholder = name;
        textField.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 40)];
        textField.leftViewMode = UITextFieldViewModeAlways;
        textField.delegate = self;
        textField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        textField.autocorrectionType = UITextAutocorrectionTypeNo;
        [fields addObject:textField]; // to use later to get values for delegates etcc
        [signinForm addSubview:textField];
        
    }
    signinAvatar = [[UIImageView alloc]initWithFrame:CGRectMake(60, 300, 220, 30)];
    signinAvatar.backgroundColor = [UIColor whiteColor];
    [signinForm addSubview:signinAvatar];
    
    UIButton *submitButton = [[UIButton alloc] initWithFrame:CGRectMake(0,[fieldNames count] * 50, 280, 40)];
    submitButton.backgroundColor = [UIColor blueColor];
    [submitButton setTitle:@"Sign Up" forState:UIControlStateNormal];
    [submitButton addTarget:self action:@selector(signUp) forControlEvents:UIControlEventTouchUpInside];
    [signinForm addSubview:submitButton];
    
    
}

-(void) hideKeyboard
{

    for(UITextField *textFieldItem in fields)
    {
        [textFieldItem resignFirstResponder];
    }
    [UIView animateWithDuration:0.3 animations:^{
        signinForm.frame = CGRectMake(20, signinOrigY, 280, 240);
    }];
}


-(void) signUp
{
    PFUser *user =[PFUser user];
    //UITextField *username = (UITextField *) fields[0];
    user.username = ((UITextField *)fields[0]).text;
    user.password = ((UITextField *)fields[1]).text;
    user.email = ((UITextField *)fields[3]).text;
    
    user[@"displayName"] = ((UITextField *)fields[2]).text;
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if(error == nil)
        {
            UINavigationController *pnc = (UINavigationController *)self.presentingViewController;
            pnc.navigationBarHidden = NO;
            pnc.viewControllers =@[[[SLFTableViewController alloc] initWithStyle:UITableViewStylePlain]];//array of view controllers

            [self cancelSignUp];
        }else {
           NSString *errorInfo = error.userInfo[@"error"];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Username Taken" message: errorInfo
                                                           delegate:self cancelButtonTitle:@"Try Another Username" otherButtonTitles:nil];
            [alert show];
        }
    }];
}

-(void) cancelSignUp
{
   [self.navigationController dismissViewControllerAnimated:YES completion:^{
       
   }];
}

//- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
//{
//    NSInteger index = [fields indexOfObject:textField];
//    NSInteger emptyIndex = [fields count];
//    for (UITextField *textFieldItem in fields)
//    {
//        NSInteger fieldIndex = [fields indexOfObject:textFieldItem];
//        if(emptyIndex < [fields count])
//        {
//            if ([textFieldItem.text isEqualToString:@""])
//            {
//                emptyIndex = fieldIndex;
//            }
//        }
//    }
//    if (index <= emptyIndex)  return YES;
//    return NO;
//}

-(void) textFieldDidBeginEditing:(UITextField *)textField
{
    int extraSlide = 0;
    NSLog(@"%.00f", self.view.frame.size.height);
    if (self.view.frame.size.height > 500) { // for 4inch of height 504
       extraSlide = 107;
    }else{ // for 3 inch of height 416
         NSInteger index = [fields indexOfObject:textField];
        extraSlide  = index *25 + 65;
  
    }
    [UIView animateWithDuration:0.3 animations:^{
        signinForm.frame = CGRectMake(20, signinOrigY-extraSlide, 280, 240);
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


@end
