//
//  AppDelegate.h
//  PJSidePanel
//
//  Created by JK.Peng on 11/14/13.
//  Copyright (c) 2013 njut. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftViewController.h"

@class JASidePanelController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) JASidePanelController *sidePanelController;
@property (nonatomic, retain) LeftViewController    *leftController;

@end
