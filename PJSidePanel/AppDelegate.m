//
//  AppDelegate.m
//  PJSidePanel
//
//  Created by JK.Peng on 11/14/13.
//  Copyright (c) 2013 njut. All rights reserved.
//

#import "AppDelegate.h"
#import "JASidePanelController.h"
#import "SlidMenuManager.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.sidePanelController.leftPanel = self.leftController;
    self.sidePanelController.centerPanel = [[SlidMenuManager sharedManager] getViewControllerByMenuType:SlidMenuType0];
    self.window.rootViewController = self.sidePanelController;
    [self.window makeKeyAndVisible];
    return YES;
}

#pragma mark - getter
- (JASidePanelController  *)sidePanelController{
    if (!_sidePanelController) {
        _sidePanelController = [[JASidePanelController alloc] init];
        _sidePanelController.shouldDelegateAutorotateToVisiblePanel = NO;
    }
    return _sidePanelController;
}

- (LeftViewController *)leftController{
    if (!_leftController) {
        _leftController = [[LeftViewController alloc] init];
    }
    return _leftController;
}

@end
