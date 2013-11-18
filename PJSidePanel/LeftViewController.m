//
//  LeftViewController.m
//  PJSidePanel
//
//  Created by JK.Peng on 11/14/13.
//  Copyright (c) 2013 njut. All rights reserved.
//

#import "LeftViewController.h"
#import "PUtil.h"
#import "SlidMenuManager.h"
#import "UIViewController+JASidePanel.h"
#import "JASidePanelController.h"

#define kSizeLeftViewWidth       260


@interface LeftViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView   *menuTableView;
@property (nonatomic, retain) NSIndexPath   *lastIndexPath;
@property (nonatomic, retain) UIImageView   *topImageView;
@property (nonatomic, retain) UIView        *topContainerView;
@end

@implementation LeftViewController

- (void)dealloc{
    
}

- (id)init{
    self = [super init];
    if (self) {
        self.lastIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_leftview.png"]];
    
    [self.menuTableView reloadData];
    [self.view addSubview:self.topImageView];
    [self.topImageView addSubview:self.topContainerView];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
    return 9;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"CellIdentifier";
    LeftViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil) {
        cell = [[LeftViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                    reuseIdentifier:CellIdentifier];
        
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    NSUInteger row = [indexPath row];
    NSUInteger oldRow = [self.lastIndexPath row];
    
    NSString  *iconStr = nil;
    
    if (row == oldRow && self.lastIndexPath != nil) {
        cell.bgImageView.image = [UIImage imageNamed:@"bg_left_cell_selected.png"];
        iconStr = [NSString stringWithFormat:@"bg_letmenu%ld_select.png",(long)[indexPath row]];
        cell.nameLabel.textColor = [PUtil getColor:@"FF9701"];
    }else{
        cell.bgImageView.image = [UIImage imageNamed:@"bg_left_cell_normal.png"];
        iconStr = [NSString stringWithFormat:@"bg_letmenu%ld.png",(long)[indexPath row]];
        cell.nameLabel.textColor = [PUtil getColor:@"999999"];
    }
    
    cell.iconImageView.image = [UIImage imageNamed:iconStr];
    
    
    NSString   *name = @"";
    switch ([indexPath row]) {
        case 0:
            name = @"NBA";
            break;
        case 1:
            name = @"CBA";
            break;
        case 2:
            name = @"中超";
            break;
        case 3:
            name = @"亚冠";
            break;
        case 4:
            name = @"欧冠";
            break;
        case 5:
            name = @"英超";
            break;
        case 6:
            name = @"德甲";
            break;
        case 7:
            name = @"意甲";
            break;
        case 8:
            name = @"西甲";
            break;
        default:
            break;
    }
    cell.nameLabel.text = name;
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 46;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSInteger newRow = [indexPath row];
    NSInteger oldRow = (self.lastIndexPath != nil) ? [self.lastIndexPath row] : -1;
    
    if (newRow != oldRow)
    {
        LeftViewCell *newCell = (LeftViewCell *)[tableView cellForRowAtIndexPath:
                                                 indexPath];
        newCell.bgImageView.image = [UIImage imageNamed:@"bg_left_cell_selected.png"];
        [newCell.nameLabel setTextColor:[PUtil getColor:@"FF9701"]];
        
        NSString *newIcon = [NSString stringWithFormat:@"bg_letmenu%ld_select.png",(long)[indexPath row]];
        newCell.iconImageView.image = [UIImage imageNamed:newIcon];
        
        LeftViewCell *oldCell = (LeftViewCell *) [tableView cellForRowAtIndexPath:
                                                  self.lastIndexPath];
        oldCell.bgImageView.image = [UIImage imageNamed:@"bg_left_cell_normal.png"];
        [oldCell.nameLabel setTextColor:[PUtil getColor:@"999999"]];
        
        NSString *oldIcon = [NSString stringWithFormat:@"bg_letmenu%ld.png",(long)[self.lastIndexPath row]];
        oldCell.iconImageView.image = [UIImage imageNamed:oldIcon];
        
        self.lastIndexPath = indexPath;
    }
    
    // set the root controller
    self.sidePanelController.centerPanel = [[SlidMenuManager sharedManager] getViewControllerByMenuType:[indexPath row]];
}


#pragma mark - getter
- (UITableView *)menuTableView{
    if (!_menuTableView) {
        CGFloat  menuHeight = [UIScreen mainScreen].bounds.size.height-64;
        _menuTableView  = [[UITableView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height-menuHeight, kSizeLeftViewWidth, menuHeight) style:UITableViewStylePlain];
        _menuTableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _menuTableView.delegate = self;
        _menuTableView.dataSource = self;
        _menuTableView.backgroundColor = [UIColor clearColor];
        _menuTableView.backgroundView = nil;
        _menuTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_menuTableView];
    }
    return _menuTableView;
}

- (UIImageView *)topImageView{
    if (!_topImageView) {
        UIImage  *bgImage = [[UIImage imageNamed:@"bg_nav.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) resizingMode:UIImageResizingModeStretch];
        _topImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, CGRectGetHeight(self.view.frame)-CGRectGetHeight(self.menuTableView.frame))];
        _topImageView.backgroundColor = [UIColor colorWithRed:234.0/255.0f green:234.0/255.0f blue:234.0/255.0f alpha:1.0];
        _topImageView.image = bgImage;
    }
    return _topImageView;
}

- (UIView *)topContainerView{
    if (!_topContainerView) {
        _topContainerView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.topImageView.frame)-44, CGRectGetWidth(self.topImageView.frame), 44)];
        _topContainerView.backgroundColor = [UIColor clearColor];
        
        UILabel   *menuLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 12, 100, 20)];
        menuLabel.backgroundColor = [UIColor clearColor];
        menuLabel.textColor = [UIColor blackColor];
        menuLabel.font = [UIFont systemFontOfSize:16.0f];
        menuLabel.text = @"测试测试";
        [_topContainerView addSubview:menuLabel];
    }
    return _topContainerView;
}

@end

@implementation LeftViewCell
@synthesize bgImageView = _bgImageView;
@synthesize nameLabel = _nameLabel;
@synthesize iconImageView = _iconImageView;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

#pragma mark getter/setter
- (UILabel *)nameLabel{
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(43, 13, 100, 20)];
        [_nameLabel setBackgroundColor:[UIColor clearColor]];
        [_nameLabel setTextAlignment:NSTextAlignmentLeft];
        [_nameLabel setFont:[UIFont systemFontOfSize:13.0]];
        [_nameLabel setTextColor:[PUtil getColor:@"999999"]];
        [self.contentView addSubview:_nameLabel];
    }
    return _nameLabel;
}

- (UIImageView *)bgImageView{
    if (!_bgImageView) {
        _bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kSizeLeftViewWidth, 46)];
        _bgImageView.backgroundColor = [UIColor clearColor];
        _bgImageView.userInteractionEnabled = YES;
        [self.contentView addSubview:_bgImageView];
    }
    return _bgImageView;
}

- (UIImageView *)iconImageView{
    if (!_iconImageView) {
        UIImage   *img = [UIImage imageNamed:@"bg_letmenu0.png"];
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(14, floorf((46-img.size.height)/2), img.size.width, img.size.height)];
        _iconImageView.backgroundColor = [UIColor clearColor];
        _iconImageView.userInteractionEnabled = YES;
        [self.contentView addSubview:_iconImageView];
    }
    return _iconImageView;
}

@end
