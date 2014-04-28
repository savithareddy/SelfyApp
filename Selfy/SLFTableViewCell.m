//
//  SLFTableViewCell.m
//  Selfy
//
//  Created by Savitha Reddy on 4/21/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "SLFTableViewCell.h"
#import <parse/Parse.h>


@implementation SLFTableViewCell
{
   UIImageView *selfyView;
    UILabel *selfyCaption;
    UIImageView *avatarView;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        selfyView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 280, 200)];
        //selfyView.contentMode = UIViewContentModeScaleAspectFill;
        //selfyView.clipsToBounds = YES;
        selfyView.layer.masksToBounds=YES;
       [self.contentView addSubview:selfyView];
        
        selfyCaption = [[UILabel alloc] initWithFrame:CGRectMake(70, 230, 100, 30)];
        //selfyCaption.text = @"Awesome !!!";
        selfyCaption.font = [UIFont fontWithName:@"Times New Roman" size:15];
       [self.contentView addSubview:selfyCaption];
        
        avatarView =[[UIImageView alloc] initWithFrame:CGRectMake(30, 230, 30, 30)];
        avatarView.layer.cornerRadius = 15;
        //avatarView.contentMode = UIViewContentModeScaleAspectFill;
       // avatarView.clipsToBounds = YES;
        avatarView.layer.masksToBounds=YES;
        [self.contentView addSubview:avatarView];
        
    }
    return self;
}

-(void) setSelfyInfo:(PFObject *)selfyInfo //chnaged from NSDictionary to PFObject// does not ike literals
{
    _selfyInfo = selfyInfo;
    
    //selfyCaption.text = selfyInfo[@"caption"];
    //selfyUserID.text = selfyInfo[@"user_ID"];
    
   
    
   
//    NSURL *imageURL = [NSURL URLWithString:selfyInfo[@"image"]];
//    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
//    UIImage *image = [UIImage imageWithData:imageData];
    
   
   //NSData *imageData= [imageFile getData];
//    UIImage *image = [UIImage imageWithData:imageData];
    
     selfyCaption.text = [selfyInfo objectForKey:@"caption"];
    
     PFFile *imageFile = [selfyInfo objectForKey:@"imageFile"];
    [imageFile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) { // to remove the error shown below
//       NSData *imageData= [imageFile getData];
        UIImage *image = [UIImage imageWithData:data];
        selfyView.image = image;
    }progressBlock:^(int percentDone) {
        //do something
    }];
    
  // selfyView.image = image;
    
//    NSURL *avatarURL = [NSURL URLWithString:selfyInfo[@"avatar"]];
//    NSData *avatarData = [NSData dataWithContentsOfURL:avatarURL];
//    UIImage *avatar = [UIImage imageWithData:avatarData];
//    avatarView.image = avatar;
    
    UIImage *avatarImage = [UIImage imageNamed:@"Avatar.png"];
    avatarView.image = avatarImage;
}


- (void)awakeFromNib
{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

   
}

@end
