//
//  SHPBaseTableViewController.m
//  测试代码
//
//  Created by songhuipan on 16/9/22.
//  Copyright © 2016年 songhuipan. All rights reserved.
//

#import "SHPBaseTableViewController.h"

@interface SHPBaseTableViewController ()
@property (nonatomic,assign)UITableViewStyle tableViewStyle;
@end

@implementation SHPBaseTableViewController
- (id)init
{
    self = [super init];
    
    if (self) {
        _tableViewStyle = UITableViewStylePlain;
    }
    
    return self;
}
- (id)initWithTableViewStyle:(UITableViewStyle)tableViewStyle
{
    self = [super init];
    if (self ) {
        _tableViewStyle = tableViewStyle;
    }
    
    return self;
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // deselect Row
    NSIndexPath *index = [_tableView indexPathForSelectedRow];
    [_tableView deselectRowAtIndexPath:index animated:YES];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadTableView];
}
# pragma mark - UITableViewCellSeparatorInsets
- (void)viewDidLayoutSubviews
{
    if ([_tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [_tableView setLayoutMargins:UIEdgeInsetsZero];
    }
}

- (void)loadTableView
{
    _tableView = [self tableViewWithStyle:_tableViewStyle];
    _tableView.separatorInset = UIEdgeInsetsMake(0, 10, 0, 0);
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.frame = self.view.frame;
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    
    _tableView.tableFooterView = [UIView new];
    
    [self.view addSubview:_tableView];
    
    
    
}
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [self tableViewWithStyle:_tableViewStyle];
    }
    return _tableView;
}
- (UITableView *)tableViewWithStyle:(UITableViewStyle)tableViewStyle
{
    if (!_tableView) {
        UITableView *tableView;
        CGFloat width = CGRectGetWidth(ScreenFrame);
        
        tableView = [[[self tableViewClass] alloc]initWithFrame:CGRectMake(0, 0, width, 0) style:tableViewStyle];
        tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _tableView = tableView;
    }
    return _tableView;
    
}
- (Class)tableViewClass
{
    return [UITableView class];
}
# pragma mark - tableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return .01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return .01;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
























































































