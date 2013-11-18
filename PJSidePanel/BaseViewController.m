//
//  BaseViewController.m
//  PJSidePanel
//
//  Created by JK.Peng on 11/15/13.
//  Copyright (c) 2013 njut. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@property (nonatomic, retain) UILabel       *titleLabel;

@end

@implementation BaseViewController

- (id)init{
    self = [super init];
    if (self) {
        self.titleColor = [UIColor blackColor];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

#pragma mark - getter
- (UIView *)containerView{
    if (!_containerView) {
        CGFloat  viewHeight = [UIScreen mainScreen].bounds.size.height-64;
        CGFloat  originY;
        if ([[[UIDevice currentDevice] systemVersion] floatValue]<7.0) {
            originY = 0.0f;
        }else{
            originY = CGRectGetHeight(self.view.frame)-viewHeight;
        }
        _containerView = [[UIView alloc] initWithFrame:CGRectMake(0, originY, CGRectGetWidth(self.view.frame), viewHeight)];
        _containerView.backgroundColor = [UIColor clearColor];
        [self.view addSubview:_containerView];
    }
    return _containerView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 25)];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = kColorForTitleLabel;
        _titleLabel.font = kSizeFontForTitleLabel;
    }
    return _titleLabel;
}

#pragma mark - setter
- (void)setTitleText:(NSString *)titleText{
    if ([titleText length]<=0) {
        if (_titleLabel.superview) {
            [_titleLabel removeFromSuperview];
        }
        _titleText = nil;
        self.navigationItem.titleView = nil;
    }else{
        if(_titleText != titleText)
        {
            _titleText = titleText;
            
        }
        
        [self.titleLabel setText:titleText];
        CGSize size = [self.titleLabel sizeThatFits:CGSizeMake(CGFLOAT_MAX, self.titleLabel.bounds.size.height)];
        CGRect  frame = self.titleLabel.frame;
        frame.size.width = size.width;
        self.titleLabel.frame = frame;
        self.navigationItem.titleView = self.titleLabel;
        
    }

}

@end
