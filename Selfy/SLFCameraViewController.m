//
//  SLFCameraViewController.m
//  Selfy
//
//  Created by Savitha Reddy on 4/22/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//
//
//  SLFCameraViewController.m
//  Selfy
//
//  Created by Savitha Reddy on 4/22/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "SLFCameraViewController.h"
#import <Parse/Parse.h>

@interface SLFCameraViewController () <UITextViewDelegate>

@end

@implementation SLFCameraViewController
{
    UIView *imageArea;
    UIImageView *image;
    UITextView *captionField;
    UIButton *submitButton1;
    UIView *header;
    UILabel *nameLabel;
    UIButton *settingButton;
    UIButton *cancelButton;
    UIView *newForm;
    UIImageView *imageView;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapScreen)];
        [self.view addGestureRecognizer:tap];
    }
    return self;
}

-(void) tapScreen
{
    captionField.text =@"";
    [captionField resignFirstResponder];
    [UIView animateWithDuration:0.2 animations:^{
        newForm.frame = self.view.frame;
    }];
    
}
-(void) textViewDidBeginEditing:(UITextView *)textView
{
    [UIView animateWithDuration:0. animations:^{
        newForm.frame = CGRectMake(0, -KB_HEIGHT, 320, self.view.frame.size.height);
    }];
    //[textView resignFirstResponder];
}

//- (BOOL)textViewShouldReturn:(UITextView *)textView
//{
//    [textView resignFirstResponder];
//    return YES;
//}

-(void) pressSubmit1
{
    //captionField.text =@"";
    //    [captionField resignFirstResponder];
    
    //UIImage *images = [UIImage imageNamed:@"squares.png"];
    //NSData *imageData = UIImagePNGRepresentation(images);
    
    //connect current user to newSelfy as parent : parse "relational data" -/objects/relational data/ to create a parent
    
    
    
    // PFFile *imageFile = [PFFile fileWithName:@"squares.png" data:imageData]; // cool squares also can be written instead of squares.png
    
    NSData *imageData = UIImagePNGRepresentation(imageView.image);
    PFFile *imageFile = [PFFile fileWithName:@"image_squares" data:imageData];//image can be called as any //used later
    
    PFObject *userPhoto = [PFObject objectWithClassName:@"UserSelfy"];
    
    userPhoto[@"caption"]= captionField.text; //to use data from textfield send to parse
    userPhoto[@"imageFile"] = imageFile; // not creating a row here but
    //userPhoto[@"imageName"] = @"SelfyApp in Progress!";
    //userPhoto[@"imageFile"] = imageFile;
    //    [userPhoto saveInBackground];
    userPhoto[@"parent"] = [PFUser currentUser];
    
    
    [userPhoto saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        NSLog(@"%u",succeeded);
        [self pressCancel1];
    }];
    
    
    
}

-(void) createForm // check
{
    
    newForm = [[UIView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:newForm];
    
    ///////
    
    imageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 0, 280, 280)];
    imageView.image = [UIImage imageNamed:@"squares"];
    [newForm addSubview:imageView];
    
    //    image = [[UIImageView alloc] initWithFrame:CGRectMake(90, 90, 130, 130)];
    //    image.image = [UIImage imageNamed:@"camera.jpeg"];
    //    [newForm addSubview:image];
    
    //////
    
    //    header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
    //    header.backgroundColor = [UIColor lightGrayColor];
    //    header.alpha = 0.8;
    //    [self.view addSubview:header];
    //
    //    nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(130, 10, 60, 30)];
    //    nameLabel.text = @"SELFY";
    //    nameLabel.textColor = [UIColor blackColor];
    //    nameLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:15];
    //    [header addSubview:nameLabel];
    //
    //    cancelButton = [[UIButton alloc]initWithFrame:CGRectMake(270, 10, 30, 30)];
    //    cancelButton.backgroundColor = [UIColor blackColor];
    //    cancelButton.layer.cornerRadius = 15;
    //    [cancelButton setTitle:@"X" forState:UIControlStateNormal];
    //    [cancelButton addTarget:self action:@selector(pressAdd) forControlEvents:UIControlEventTouchUpInside];
    //    [self.view addSubview:cancelButton];
    //
    ////    imageArea = [[UIView alloc] initWithFrame:CGRectMake(10, 60, 300, 300)];
    ////    imageArea.backgroundColor = [UIColor whiteColor];
    ////    imageArea.alpha = 0.8;
    ////    [newForm addSubview:imageArea];
    
    
    captionField = [[UITextView alloc]initWithFrame:CGRectMake(20, 300, 280, 70)];
    captionField.backgroundColor = [UIColor whiteColor];
    captionField.keyboardType = UIKeyboardTypeTwitter;
    [newForm addSubview:captionField];
    
    submitButton1 = [[UIButton alloc] initWithFrame:CGRectMake(110, 400, 100, 30)];
    submitButton1.backgroundColor = [UIColor blueColor];
    [submitButton1 setTitle:@"SUBMIT" forState:UIControlStateNormal];
    [submitButton1 addTarget:self action:@selector(pressSubmit1) forControlEvents:UIControlEventTouchUpInside];
    [newForm addSubview:submitButton1];
    
    captionField.delegate = self;
}


-(void) pressCancel1
{
    captionField.text =@"";
    [captionField resignFirstResponder];
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self createForm];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

@end










