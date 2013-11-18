//
//  SlidMenuManager.m
//  PJSidePanel
//
//  Created by JK.Peng on 11/14/13.
//  Copyright (c) 2013 njut. All rights reserved.
//

#import "SlidMenuManager.h"
#import "TestViewController.h"
#import "PUtil.h"

@interface SlidMenuManager()

@property (nonatomic, retain) UITabBarController        *tabbarController;
@property (nonatomic, retain) UINavigationController    *navController1;
@property (nonatomic, retain) UINavigationController    *navController2;
@property (nonatomic, retain) UINavigationController    *navController3;
@property (nonatomic, retain) UINavigationController    *navController4;
@property (nonatomic, retain) UINavigationController    *navController5;
@property (nonatomic, retain) UINavigationController    *navController6;
@property (nonatomic, retain) UINavigationController    *navController7;
@property (nonatomic, retain) UINavigationController    *navController8;
@end

@implementation SlidMenuManager

+ (SlidMenuManager *)sharedManager
{
    static SlidMenuManager  *slideMenuManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        slideMenuManager = [[SlidMenuManager alloc] init];
    });
    
    return slideMenuManager;
}

- (id)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (UIViewController *)getViewControllerByMenuType:(SlidMenuTypeE)menuType;
{
    UIViewController  *viewController = nil;
    switch (menuType) {
        case SlidMenuType0:
            viewController = self.tabbarController;
            break;
        case SlidMenuType1:
            viewController = self.navController1;
            break;
        case SlidMenuType2:
            viewController = self.navController2;
            break;
        case SlidMenuType3:
            viewController = self.navController3;
            break;
        case SlidMenuType4:
            viewController = self.navController4;
            break;
        case SlidMenuType5:
            viewController = self.navController5;
            break;
        case SlidMenuType6:
            viewController = self.navController6;
            break;
        case SlidMenuType7:
            viewController = self.navController7;
            break;
        case SlidMenuType8:
            viewController = self.navController8;
            break;
        default:
            break;
    }
    return viewController;
}

#pragma mark- getter
- (UITabBarController *)tabbarController{
    if (!_tabbarController) {
        _tabbarController = [[UITabBarController alloc] init];
        TestViewController  *controller0 = [[TestViewController alloc] init];
        controller0.view.backgroundColor = [UIColor redColor];
        controller0.titleText = @"测试0";
        controller0.tabBarItem.title = @"测试0";
        controller0.tabBarItem.image = [UIImage imageNamed:@"icon_tab.png"];
        UINavigationController  *navController = [[UINavigationController alloc] initWithRootViewController:controller0];
        UIImage  *bgImage = [[UIImage imageNamed:@"bg_nav.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) resizingMode:UIImageResizingModeStretch];
        [navController.navigationBar setBackgroundImage:bgImage forBarMetrics:UIBarMetricsDefault];

        TestViewController  *controller1 = [[TestViewController alloc] init];
        controller1.view.backgroundColor = [UIColor greenColor];
        controller1.tabBarItem.title = @"测试1";
        controller1.tabBarItem.image = [UIImage imageNamed:@"icon_tab.png"];
        TestViewController  *controller2 = [[TestViewController alloc] init];
        controller2.view.backgroundColor = [UIColor orangeColor];
        controller2.tabBarItem.title = @"测试2";
        controller2.tabBarItem.image = [UIImage imageNamed:@"icon_tab.png"];
        TestViewController  *controller3 = [[TestViewController alloc] init];
        controller3.view.backgroundColor = [UIColor blueColor];
        controller3.tabBarItem.title = @"测试3";
        controller3.titleText = @"测试3";
        UINavigationController  *navController3 = [[UINavigationController alloc] initWithRootViewController:controller3];
        [navController3.navigationBar setBackgroundImage:bgImage forBarMetrics:UIBarMetricsDefault];

        controller3.tabBarItem.image = [UIImage imageNamed:@"icon_tab.png"];
        TestViewController  *controller4 = [[TestViewController alloc] init];
        controller4.tabBarItem.title = @"测试４";
        controller4.tabBarItem.image = [UIImage imageNamed:@"icon_tab.png"];
        _tabbarController.viewControllers = @[navController,controller1,controller2,navController3,controller4];
    }
    return _tabbarController;
}

- (UINavigationController *)navController1{
    if (!_navController1) {
        TestViewController  *controller = [[TestViewController alloc] init];
        _navController1 = [[UINavigationController alloc] initWithRootViewController:controller];
        controller.titleText = @"Test1";
        controller.view.backgroundColor = [UIColor orangeColor];

        UIImage  *bgImage = [[UIImage imageNamed:@"bg_nav.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) resizingMode:UIImageResizingModeStretch];
        [_navController1.navigationBar setBackgroundImage:bgImage forBarMetrics:UIBarMetricsDefault];
        
    }
    return _navController1;
}

- (UINavigationController *)navController2{
    if (!_navController2) {
        TestViewController  *controller = [[TestViewController alloc] init];
        _navController2 = [[UINavigationController alloc] initWithRootViewController:controller];
        controller.titleText = @"Test2";
        controller.view.backgroundColor = [UIColor darkGrayColor];

        UIImage  *bgImage = [[UIImage imageNamed:@"bg_nav.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) resizingMode:UIImageResizingModeStretch];
        [_navController2.navigationBar setBackgroundImage:bgImage forBarMetrics:UIBarMetricsDefault];
        
    }
    return _navController2;
}

- (UINavigationController *)navController3{
    if (!_navController3) {
        TestViewController  *controller = [[TestViewController alloc] init];
        _navController3 = [[UINavigationController alloc] initWithRootViewController:controller];
        controller.titleText = @"Test3";
        controller.view.backgroundColor = [UIColor greenColor];

        UIImage  *bgImage = [[UIImage imageNamed:@"bg_nav.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) resizingMode:UIImageResizingModeStretch];

        [_navController3.navigationBar setBackgroundImage:bgImage forBarMetrics:UIBarMetricsDefault];
        
    }
    return _navController3;
}

- (UINavigationController *)navController4{
    if (!_navController4) {
        TestViewController  *controller = [[TestViewController alloc] init];
        _navController4 = [[UINavigationController alloc] initWithRootViewController:controller];
        controller.titleText = @"Test4";
        controller.view.backgroundColor = [UIColor redColor];

        UIImage  *bgImage = [[UIImage imageNamed:@"bg_nav.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) resizingMode:UIImageResizingModeStretch];
        [_navController4.navigationBar setBackgroundImage:bgImage forBarMetrics:UIBarMetricsDefault];
        
    }
    return _navController4;
}

- (UINavigationController *)navController5{
    if (!_navController5) {
        TestViewController  *controller = [[TestViewController alloc] init];
        _navController5 = [[UINavigationController alloc] initWithRootViewController:controller];
        controller.titleText = @"Test5";
        controller.view.backgroundColor = [UIColor blueColor];

        UIImage  *bgImage = [[UIImage imageNamed:@"bg_nav.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) resizingMode:UIImageResizingModeStretch];

        [_navController5.navigationBar setBackgroundImage:bgImage forBarMetrics:UIBarMetricsDefault];
    }
    return _navController5;
}

- (UINavigationController *)navController6{
    if (!_navController6) {
        TestViewController  *controller = [[TestViewController alloc] init];
        _navController6 = [[UINavigationController alloc] initWithRootViewController:controller];
        controller.titleText = @"Test6";
        controller.view.backgroundColor = [UIColor magentaColor];

        UIImage  *bgImage = [[UIImage imageNamed:@"bg_nav.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) resizingMode:UIImageResizingModeStretch];
        [_navController6.navigationBar setBackgroundImage:bgImage forBarMetrics:UIBarMetricsDefault];
        
    }
    return _navController6;
}

- (UINavigationController *)navController7{
    if (!_navController7) {
        TestViewController  *controller = [[TestViewController alloc] init];
        _navController7 = [[UINavigationController alloc] initWithRootViewController:controller];
        controller.titleText = @"Test7";
        controller.view.backgroundColor = [UIColor cyanColor];

        UIImage  *bgImage = [[UIImage imageNamed:@"bg_nav.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) resizingMode:UIImageResizingModeStretch];

        [_navController7.navigationBar setBackgroundImage:bgImage forBarMetrics:UIBarMetricsDefault];
        
    }
    return _navController7;
}

- (UINavigationController *)navController8{
    if (!_navController8) {
        TestViewController  *controller = [[TestViewController alloc] init];
        _navController8 = [[UINavigationController alloc] initWithRootViewController:controller];
        controller.titleText = @"Test8";
        controller.view.backgroundColor = [UIColor brownColor];

        UIImage  *bgImage = [[UIImage imageNamed:@"bg_nav.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) resizingMode:UIImageResizingModeStretch];
        [_navController8.navigationBar setBackgroundImage:bgImage forBarMetrics:UIBarMetricsDefault];
        
    }
    return _navController8;
}


@end
