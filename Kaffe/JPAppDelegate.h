//
//  JPAppDelegate.h
//  Kaffe
//
//  Created by Jon Packer on 9/11/11.
//  Copyright (c) 2011 Creative Intersection. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JPViewController;

@interface JPAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) JPViewController *viewController;

@end
