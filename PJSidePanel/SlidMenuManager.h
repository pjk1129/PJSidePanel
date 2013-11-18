//
//  SlidMenuManager.h
//  PJSidePanel
//
//  Created by JK.Peng on 11/14/13.
//  Copyright (c) 2013 njut. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SlidMenuManager : NSObject

+ (SlidMenuManager *)sharedManager;

- (UIViewController *)getViewControllerByMenuType:(SlidMenuTypeE)menuType;

@end
