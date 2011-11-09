//
//  JPViewController.m
//  Kaffe
//
//  Created by Jon Packer on 9/11/11.
//  Copyright (c) 2011 Creative Intersection. All rights reserved.
//

#import "JPViewController.h"
#import "ASIHTTPRequest.h"
#import "JSONKit.h"
#import "UIImageView+WebCache.h"
#import "JPDetailViewController.h"

@implementation JPViewController

@synthesize tableView = _tableView;

- (void) loadData {
  NSString* dataUrl = @"http://www.jonpacker.com/kaffe.json";
  __block ASIHTTPRequest* request = [[ASIHTTPRequest alloc] initWithURL:[NSURL URLWithString:dataUrl]];
  [request setCompletionBlock:^{
    _tableData = [[request.responseData objectFromJSONData] retain];
    [_tableView reloadData];
  }];
  [request setFailedBlock:^{
    // Would normally handle errors here
  }];
  [request startAsynchronous];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString* cellIdentifier = @"cellId";
  
  UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
  if (!cell) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
  }
  
  NSDictionary* item = [_tableData objectAtIndex:indexPath.row];
  
  cell.textLabel.text = [item objectForKey:@"type"];
  
  return cell;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
  return !!_tableData;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return _tableData ? _tableData.count : 0;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [tableView deselectRowAtIndexPath:indexPath animated:YES];
  
  NSDictionary* item = [_tableData objectAtIndex:indexPath.row];
  
  NSString* nibName = @"JPDetailViewController";
  NSBundle* bundle = [NSBundle mainBundle];
  JPDetailViewController* detailViewController = [[JPDetailViewController alloc] initWithNibName:nibName bundle:bundle];
  
  detailViewController.dataItem = item;
  
  [self.navigationController pushViewController:detailViewController animated:YES];
  [detailViewController release];
}

- (void) viewDidLoad {
  [super viewDidLoad];
  [self loadData];
}

- (void) dealloc {
  self.tableView = nil;
  [_tableData release], _tableData = nil;
  [super dealloc];
}

@end
