//
//  BaseViewController.h
//  PJSidePanel
//
//  Created by JK.Peng on 11/15/13.
//  Copyright (c) 2013 njut. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PUtil.h"

#define kColorForTitleLabel     [PUtil getColor:@"111111"]
#define kSizeFontForTitleLabel  [UIFont systemFontOfSize:16.0f]

@interface BaseViewController : UIViewController

@property (nonatomic, retain) UIView        *containerView;   //视图容器
@property (nonatomic, copy) NSString        *titleText;       //设置title
@property (nonatomic, retain) UIColor       *titleColor;      //设置titleColor

@end
