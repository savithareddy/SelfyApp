//
//  SLFBlurViewController.m
//  Selfy
//
//  Created by Savitha Reddy on 5/3/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "SLFBlurViewController.h"

@interface SLFBlurViewController ()

@property (nonatomic) NSString * currentFilter;

@end

@implementation SLFBlurViewController
{
    UISwitch * blurToggle;
    UISlider * blurIntensity;
    float blurLevel;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        blurLevel = 10;
        
        blurToggle = [[UISwitch alloc]initWithFrame:CGRectMake(260, 25, 20, 50)];
        blurToggle.on = YES;
        [blurToggle addTarget:self action:@selector(changeBlurType) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:blurToggle];
        
        blurIntensity = [[UISlider alloc]initWithFrame: CGRectMake(20, 25, 220, 50)];
        blurIntensity.minimumValue = 0.0;
        blurIntensity.maximumValue = 100.0;
        blurIntensity.value = blurLevel;
        [blurIntensity addTarget:self action:@selector(changeBlurType) forControlEvents:UIControlEventValueChanged];
        [self.view addSubview:blurIntensity];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

-(void)changeBlurType
{
    if (blurToggle.on == YES)
    {
        self.currentFilter = @"CIBoxBlur";
    }else{
        self.currentFilter = @"CIGaussianBlur";
    }
    
    UIImage * image = [self filterImage:self.imageToFilter filterName:self.currentFilter];
    
    [self.delegate updateCurrentImageWithFilteredImage:image];
}

- (UIImage *)filterImage:(UIImage*)image filterName:(NSString *)filterName
{
    CIImage * ciImage = [CIImage imageWithCGImage:image.CGImage];
    
    CIFilter * filter = [CIFilter filterWithName:filterName];
    
    [filter setValue:ciImage forKey:kCIInputImageKey];
    [filter setValue:@(blurLevel) forKey:kCIInputRadiusKey];
    
    CIContext * ciContext = [CIContext contextWithOptions:nil];
    
    CIImage * ciResult = [filter valueForKeyPath:kCIOutputImageKey];
    
    return [UIImage imageWithCGImage:[ciContext createCGImage:ciResult fromRect:[ciResult extent]]];
}

-(void)setImageToFilter:(UIImage *)imageToFilter
{
    _imageToFilter = imageToFilter;
}


@end
