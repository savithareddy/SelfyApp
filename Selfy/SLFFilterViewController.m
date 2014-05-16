//
//  SLFFilterViewController.m
//  Selfy
//
//  Created by Savitha Reddy on 5/3/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "SLFFilterViewController.h"

@interface SLFFilterViewController ()

@property (nonatomic) NSString *currentFilter;

@end

@implementation SLFFilterViewController
{
    UIScrollView *scrollView;
    NSArray *filterNames;
    NSMutableArray *filterButtons;
    float wh; //to make  width and height dynamic
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.view.backgroundColor = [UIColor clearColor];
        filterButtons = [@[] mutableCopy];
        filterNames = @[
                        @"CIColorInvert",
                        @"CIColorMonochrome",
                        @"CIColorPosterize",
                        @"CIFalseColor",
                        @"CIMaximumComponent",
                        @"CIMinimumComponent",
                        @"CIPhotoEffectChrome",
                        @"CIPhotoEffectFade",
                        @"CIPhotoEffectInstant",
                        @"CIPhotoEffectMono",
                        @"CIPhotoEffectNoir",
                        @"CIPhotoEffectProcess",
                        @"CIPhotoEffectTonal",
                        @"CIPhotoEffectTransfer",
                        @"CISepiaTone",
                        @"CIVignette"
                        ];
        
        scrollView= [[UIScrollView alloc] init];
        //footBar.pagingEnabled = YES;
        [self.view addSubview:scrollView];
        
        //        int squares = 20;
        //        for (int i=0; i<squares; i++) {
        //
        //            int X =  (10 + 80) * i;
        //            UIButton *buttons1 = [[UIButton alloc] initWithFrame:CGRectMake(X+10, 10, 80, 80)];
        //            buttons1.backgroundColor=[UIColor whiteColor];
        //            //  [buttons1 setImage:imageView.image forState:UIControlStateNormal];
        //            [buttons1 addTarget:self action:@selector(clickButton) forControlEvents:UIControlEventTouchUpInside];
        //            [footBar addSubview:buttons1];
        //        }
        //        footBar.contentSize = CGSizeMake((90*squares+10), 100);
        
    }
    return self;
}

- (void)viewWillLayoutSubviews // chnaged from viewdidload to view will appaear // now to this
{
    [super viewDidLoad];
    
    wh = self.view.frame.size.height -20;
    for (NSString *filterName in filterNames)
    {
        int i = (int)[filterNames indexOfObject:filterName];
        int x = (wh+10) * i+10;
        
        UIButton *filterButton = [[UIButton alloc] initWithFrame:CGRectMake(x, 10, wh, wh)];
        filterButton.tag = i;
        filterButton.backgroundColor=[UIColor whiteColor];
//        [filterButton setImage:self.imageToFilter forState:UIControlStateNormal];
        [filterButton addTarget:self action:@selector(switchFilter:) forControlEvents:UIControlEventTouchUpInside];
        [filterButtons addObject:filterButton];
        [scrollView addSubview:filterButton];
    }
    NSLog(@"%d",(int)self.view.frame.size.height);
    scrollView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    scrollView.contentSize = CGSizeMake((wh+10) * [filterNames count] + 10, self.view.frame.size.height);
    
//    self.imageToFilter = self.imageToFilter;
    [self setImageToFilter:self.imageToFilter];
}



-(UIImage *) filterImage:(UIImage *) image filterName: (NSString *) filterName
{
    CIImage *ciImage = [CIImage imageWithCGImage:image.CGImage];
    CIFilter *filter = [CIFilter filterWithName:filterName];
    [filter setValue:ciImage forKeyPath:kCIInputImageKey];
    CIContext *ciContext = [CIContext contextWithOptions:nil];
    CIImage *ciResult = [filter valueForKeyPath:kCIOutputImageKey];
    return [UIImage imageWithCGImage:[ciContext createCGImage:ciResult fromRect:[ciResult extent]]]; //one line code for the 4 lines down
    //    CGRect rect = [ciResult extent];
    //    CGImageRef cgImageRef = [ciContext createCGImage:ciResult fromRect:rect];
    //    UIImage *uiImage = [UIImage imageWithCGImage:cgImageRef];
    //    return uiImage;
    
}

-(UIImage *) shrinkImage: (UIImage *)image maxWH: (int)widthHeight
{
    CGSize size = CGSizeMake(widthHeight, widthHeight/image.size.height * image.size.width);
    
    if(image.size.height <image.size.width)
    {
        size = CGSizeMake(widthHeight/ image.size.height * image.size.width, widthHeight);
    }
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *destImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return destImage;
}

-(void)switchFilter: (UIButton *)filterButton
{
    self.currentFilter = [filterNames objectAtIndex:filterButton.tag];
    UIImage * image = [self filterImage:self.imageToFilter filterName:self.currentFilter];
    [self.delegate updateCurrentImageWithFilteredImage:image];
    }

-(void) setImageToFilter:(UIImage *)imageToFilter
{
    _imageToFilter = imageToFilter;
    
    for (UIButton *filterButton  in filterButtons)
    {
        [filterButton setImage:nil forState:UIControlStateNormal];
        NSString *filterName = [filterNames objectAtIndex:filterButton.tag];
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, (unsigned long)NULL),^{
            
            UIImage * smallImage = [self shrinkImage:imageToFilter maxWH:wh *2];
            UIImage *image = [self filterImage:smallImage filterName:filterName];
            
            dispatch_async(dispatch_get_main_queue(), ^(void){
                
                [filterButton setImage:image forState:UIControlStateNormal];
                filterButton.imageView.contentMode = UIViewContentModeScaleAspectFill;
                
            });
        });
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}


@end
