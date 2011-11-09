//
//  JPDetailViewController.h
//  Kaffe
//
//  Created by Jon Packer on 9/11/11.
//  Copyright (c) 2011 Creative Intersection. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JPDetailViewController : UIViewController

@property (nonatomic, retain) IBOutlet UIImageView* imageView;
@property (nonatomic, retain) IBOutlet UILabel* titleLabel;
@property (nonatomic, retain) IBOutlet UILabel* detailLabel;

@property (nonatomic, retain) NSDictionary* dataItem;

@end
