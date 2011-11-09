//
//  JPViewController.h
//  Kaffe
//
//  Created by Jon Packer on 9/11/11.
//  Copyright (c) 2011 Creative Intersection. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JPViewController : UIViewController <UITableViewDataSource, UITableViewDelegate> {
 @private
  NSArray* _tableData; 
}

@property (nonatomic, retain) IBOutlet UITableView* tableView;

@end
