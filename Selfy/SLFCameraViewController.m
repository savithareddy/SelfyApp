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
    SLFTableViewController *TVC;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        newForm = [[UIView alloc] initWithFrame:self.view.frame];
        [self.view addSubview:newForm];
        
        
        header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
        header.backgroundColor = [UIColor lightGrayColor];
        header.alpha = 0.8;
        [self.view addSubview:header];
        
        nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(130, 10, 60, 30)];
        nameLabel.text = @"SELFY";
        nameLabel.textColor = [UIColor blackColor];
        nameLabel.font = [UIFont fontWithName:@"Helvetica Neue" size:15];
        [header addSubview:nameLabel];
        
        cancelButton = [[UIButton alloc]initWithFrame:CGRectMake(270, 10, 30, 30)];
        cancelButton.backgroundColor = [UIColor blackColor];
        cancelButton.layer.cornerRadius = 15;
        [cancelButton setTitle:@"X" forState:UIControlStateNormal];
        [cancelButton addTarget:self action:@selector(pressAdd) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:cancelButton];
        
        imageArea = [[UIView alloc] initWithFrame:CGRectMake(10, 60, 300, 300)];
        imageArea.backgroundColor = [UIColor whiteColor];
        imageArea.alpha = 0.8;
        [newForm addSubview:imageArea];
        
        image = [[UIImageView alloc] initWithFrame:CGRectMake(90, 90, 130, 130)];
        image.image = [UIImage imageNamed:@"camera.jpeg"];
        [newForm addSubview:image];
        
        captionField = [[UITextView alloc]initWithFrame:CGRectMake(10, 370, 300, 130)];
        captionField.backgroundColor = [UIColor whiteColor];
        captionField.keyboardType = UIKeyboardTypeTwitter;
        [newForm addSubview:captionField];
        
        submitButton1 = [[UIButton alloc] initWithFrame:CGRectMake(110, 510, 100, 30)];
        submitButton1.backgroundColor = [UIColor blackColor];
        [submitButton1 setTitle:@"SUBMIT" forState:UIControlStateNormal];
        [submitButton1 addTarget:self action:@selector(pressSubmit1) forControlEvents:UIControlEventTouchUpInside];
        [newForm addSubview:submitButton1];
        
        captionField.delegate = self;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapScreen)];
        [self.view addGestureRecognizer:tap];
        UITapGestureRecognizer *tapImage = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImage)];
        [image addGestureRecognizer:tapImage];
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

-(void)tapImage
{
    [UIView animateWithDuration:0.2 animations:^{
         image.image = [UIImage imageNamed:@"squares.png"];
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
    captionField.text =@"";
[captionField resignFirstResponder];
    
    UIImage *images = [UIImage imageNamed:@"squares.png"];
    NSData *imageData = UIImagePNGRepresentation(images);
    
    PFFile *imageFile = [PFFile fileWithName:@"squares.png" data:imageData];
    
    PFObject *userPhoto = [PFObject objectWithClassName:@"UserSelfy"];
    userPhoto[@"imageName"] = @"SelfyApp in Progress!";
    userPhoto[@"imageFile"] = imageFile;
    [userPhoto saveInBackground];

}

-(void) pressCancel1
{
    captionField.text =@"";
    [captionField resignFirstResponder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
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
-(BOOL) prefersStatusBarHidden
{
    return YES;
}


@end
