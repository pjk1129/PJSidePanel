//
//  LeftViewController.h
//  PJSidePanel
//
//  Created by JK.Peng on 11/14/13.
//  Copyright (c) 2013 njut. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftViewController : UIViewController

@end

@interface LeftViewCell : UITableViewCell

@property (nonatomic, retain) UIImageView   *iconImageView;
@property (nonatomic, retain) UIImageView   *bgImageView;
@property (nonatomic, retain) UILabel *nameLabel;

@end