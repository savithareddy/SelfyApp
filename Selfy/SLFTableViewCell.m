//
//  SLFTableViewCell.m
//  Selfy
//
//  Created by Savitha Reddy on 4/21/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import "SLFTableViewCell.h"

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
        selfyView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 60, 280, 280)];
        //selfyView.contentMode = UIViewContentModeScaleAspectFill;
        //selfyView.clipsToBounds = YES;
        selfyView.layer.masksToBounds=YES;
       [self.contentView addSubview:selfyView];
        
        selfyCaption = [[UILabel alloc] initWithFrame:CGRectMake(70, 350, 100, 30)];
        //selfyCaption.text = @"Awesome !!!";
        selfyCaption.font = [UIFont fontWithName:@"Times New Roman" size:15];
       [self.contentView addSubview:selfyCaption];
        
        avatarView =[[UIImageView alloc] initWithFrame:CGRectMake(30, 350, 30, 30)];
        avatarView.layer.cornerRadius = 15;
        //avatarView.contentMode = UIViewContentModeScaleAspectFill;
       // avatarView.clipsToBounds = YES;
        avatarView.layer.masksToBounds=YES;
        [self.contentView addSubview:avatarView];
        
    }
    return self;
}

-(void) setSelfyInfo:(NSDictionary *)selfyInfo
{
    _selfyInfo = selfyInfo;
    
    selfyCaption.text = selfyInfo[@"caption"];
    //selfyUserID.text = selfyInfo[@"user_ID"];
    
    NSURL *imageURL = [NSURL URLWithString:selfyInfo[@"image"]];
    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
    UIImage *image = [UIImage imageWithData:imageData];
    selfyView.image = image;
    
    NSURL *avatarURL = [NSURL URLWithString:selfyInfo[@"avatar"]];
    NSData *avatarData = [NSData dataWithContentsOfURL:avatarURL];
    UIImage *avatar = [UIImage imageWithData:avatarData];
    avatarView.image = avatar;
}


- (void)awakeFromNib
{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

   
}

@end
