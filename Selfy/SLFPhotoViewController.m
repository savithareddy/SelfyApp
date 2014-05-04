//
//  SLFPhotoViewController.m
//  Selfy
//
//  Created by Savitha Reddy on 5/3/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "SLFPhotoViewController.h"
#import "SLFFilterViewController.h"
#import "SLFControlsViewController.h"
#import "SLFBlurViewController.h"
#import "SLFHsbViewController.h"
#import "SLFCameraViewController.h"
#import "SLFNewNavigationController.h"



@interface SLFPhotoViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate,SLFFilterViewControllerDelegate,
SLFControlsViewControllerDelegate,SLFBlurViewControllerDelegate,SLFHsbViewControllerDelegate>

@property (nonatomic) UIImage *originalImage; //required for many instances //local to this file

@end

@implementation SLFPhotoViewController
{
    UIImageView *imageView;
    SLFFilterViewController *filterVC; //setting this global
    SLFControlsViewController *ControlsVC;
    SLFBlurViewController *blurVC;
    SLFHsbViewController *colorVC;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    imageView = [[UIImageView alloc] initWithFrame:self.view.frame];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:imageView];
    
//    UIView *navBar  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
//    navBar.backgroundColor = [UIColor yellowColor];
//    [self.view addSubview:navBar];
    
//    UIButton *libraryButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 30, 30)];
//    libraryButton.layer.cornerRadius = 15;
//    [libraryButton setImage:[UIImage imageNamed:@"gallery"]  forState:UIControlStateNormal];
//    [libraryButton addTarget:self action:@selector(choosePhoto) forControlEvents:UIControlEventTouchUpInside];
//    libraryButton.backgroundColor = [UIColor grayColor];
//    [navBar addSubview:libraryButton];
//    
//    UIButton *nextButton = [[UIButton alloc] initWithFrame:CGRectMake(270, 10, 30, 30)];
//    nextButton.layer.cornerRadius = 15;
//    [nextButton setImage:[UIImage imageNamed:@"next"] forState:UIControlStateNormal];
//    [nextButton addTarget:self action:@selector(gotoNext) forControlEvents:UIControlEventTouchUpInside];
//    nextButton.backgroundColor = [UIColor grayColor];
//    [navBar addSubview:nextButton];
    
    UIBarButtonItem *libraryButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"gallery"] style:UIBarButtonItemStylePlain target:self action:@selector(choosePhoto)];
        self.navigationItem.leftBarButtonItem = libraryButton;
    
    UIBarButtonItem *nextButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"next"] style:UIBarButtonItemStylePlain target:self action:@selector(gotoNext)];
    self.navigationItem.rightBarButtonItem = nextButton;



    
    ControlsVC = [[SLFControlsViewController alloc] initWithNibName:nil bundle:nil];
    ControlsVC.delegate = self;
    ControlsVC.view.frame = CGRectMake(0, SCREEN_HEIGHT-140, SCREEN_WIDTH, 40);
    [self.view addSubview:ControlsVC.view];
    
    
    filterVC = [[SLFFilterViewController alloc] initWithNibName:nil bundle:nil];
    filterVC.delegate = self;
    filterVC.view.frame = CGRectMake(0, SCREEN_HEIGHT-100, SCREEN_WIDTH, 100);
    
    blurVC = [[SLFBlurViewController alloc] initWithNibName:nil bundle:nil];
    blurVC.delegate = self;
    blurVC.view.frame = CGRectMake(0, SCREEN_HEIGHT-100, SCREEN_WIDTH, 100);
    
    
    colorVC = [[SLFHsbViewController alloc] initWithNibName:nil bundle:nil];
    colorVC.delegate = self;
    colorVC.view.frame = CGRectMake(0, SCREEN_HEIGHT-100, SCREEN_WIDTH, 100);
    
}
-(void) selectFilter
{
    [self.view addSubview:filterVC.view];
    [blurVC.view removeFromSuperview];
    [colorVC.view removeFromSuperview];
    
}
-(void) selectHsb
{
    [self.view addSubview:colorVC.view];
    [filterVC.view removeFromSuperview];
    [blurVC.view removeFromSuperview];
    
}
-(void) selectBlur
{
    [self.view addSubview:blurVC.view];
    [filterVC.view removeFromSuperview];
    [colorVC.view removeFromSuperview];
    
}

-(void)updateCurrentImageWithFilteredImage:(UIImage *)image
{
    imageView.image = image;
    blurVC.imageToFilter = image;
    colorVC.currentImage  = image;
}

-(void) setOriginalImage:(UIImage *)originalImage
{
    _originalImage=originalImage;
    filterVC.imageToFilter = originalImage;
    imageView.image=originalImage;
}

-(void) choosePhoto
{
    UIImagePickerController *imagePicker =[[UIImagePickerController alloc] init];
    
    imagePicker.delegate = self;
    
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    //imagePicker.allowsEditing = YES;
    
    [self presentViewController:imagePicker animated:YES completion:nil];
}


-(void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    //NSLog(@"%@",info);
    // NSLog(@"%@", info[UIImagePickerControllerOriginalImage]);
    
    
    self.originalImage = info[UIImagePickerControllerOriginalImage];
    
    
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
    //    UIImage *image = imageView.image;
    //    CIContext *context = [CIContext contextWithOptions:nil];
    //    CIImage *rawImageData = [CIImage imageWithCGImage:image.CGImage];
    //    CIFilter *filter = [CIFilter filterWithName:@"CIPhotoEffectMono"];
    //    [filter setValue:rawImageData forKey:kCIInputImageKey];
    //    //[filter setValue:@(intensity) forKey:@"inputIntensity"];
    //    CIImage *filteredImageData = [filter valueForKey:kCIOutputImageKey];
    //    CGImageRef cgImgRef = [context createCGImage:filteredImageData fromRect:[filteredImageData extent]];
    //    UIImage *newImage = [UIImage imageWithCGImage:cgImgRef];
    //    CGImageRelease(cgImgRef);
    //    imageView.image = newImage;
}
-(void) gotoNext
{
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.viewControllers = @[[[SLFCameraViewController alloc] initWithNibName:nil bundle:nil]];
    self.navigationController.navigationBar.barTintColor = [UIColor blueColor];
    self.navigationController.navigationBar.translucent = NO;

//    SLFCameraViewController *caption = [[SLFCameraViewController alloc] initWithNibName:nil bundle:nil];
//    SLFNewNavigationController *navControl = [[SLFNewNavigationController alloc] initWithRootViewController:caption];
//     //navControl.navigationBarHidden =YES;
//    [self.navigationController pushViewController:navControl animated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

-(BOOL) prefersStatusBarHidden
{
    return YES;
}


@end
