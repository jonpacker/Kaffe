//
//  JPDetailViewController.m
//  Kaffe
//
//  Created by Jon Packer on 9/11/11.
//  Copyright (c) 2011 Creative Intersection. All rights reserved.
//

#import "JPDetailViewController.h"
#import "UIImageView+WebCache.h"

@implementation JPDetailViewController

@synthesize detailLabel = _detailLabel;
@synthesize titleLabel = _titleLabel;
@synthesize imageView = _imageView;
@synthesize dataItem = _dataItem;

- (void) viewDidLoad {
  [super viewDidLoad];
  
  self.titleLabel.text = self.title = [self.dataItem objectForKey:@"type"];
  self.detailLabel.text = [self.dataItem objectForKey:@"desc"];
  [self.imageView setImageWithURL:[NSURL URLWithString:[self.dataItem objectForKey:@"image"]]];
}

- (void) dealloc {
  self.detailLabel = nil;
  self.titleLabel = nil;
  self.imageView = nil;
  self.dataItem = nil;
  [super dealloc];
}



@end
