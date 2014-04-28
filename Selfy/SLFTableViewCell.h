//
//  SLFTableViewCell.h
//  Selfy
//
//  Created by Savitha Reddy on 4/21/14.
//  Copyright (c) 2014 Savitha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface SLFTableViewCell : UITableViewCell


//@property (nonatomic) NSDictionary *selfyInfo;

@property (nonatomic) PFObject *selfyInfo;

@end
