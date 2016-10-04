//
//  SHPBaseTableViewController.m
//  测试代码
//
//  Created by songhuipan on 16/10/2.
//  Copyright © 2016年 songhuipan. All rights reserved.
//

#import "SHPBaseTableViewController.h"
#import "MJRefresh.h"
#import "TPKeyboardAvoidingTableView.h"
@interface SHPBaseTableViewController ()
@property (nonatomic,assign)UITableViewStyle tableViewStyle;
@property (nonatomic,strong)TPKeyboardAvoidingTableView *tableView;
@end

@implementation SHPBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _pageNO = 1;
    _pageSize = 15;
    
    [self.view addSubview:self.tableView];
}
# pragma mark - 隐藏tableView左侧15像素空白的方法
//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
//        [cell setSeparatorInset:UIEdgeInsetsZero];
//    }
//    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
//        [cell setLayoutMargins:UIEdgeInsetsZero];
//    }
//}
- (void)changeTableViewLinesLength
{
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.tableView setLayoutMargins:UIEdgeInsetsZero];
    }
    
}
- (void)setIsOpenHeaderRefresh:(BOOL)isOpenHeaderRefresh
{
    if (_isOpenHeaderRefresh == isOpenHeaderRefresh) {
        return;
    }
    _isOpenHeaderRefresh = isOpenHeaderRefresh;
    WeakSelf(SHPBaseTableViewController);
    if (isOpenHeaderRefresh) {
        // 设置头部刷新
        self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            weakSelf.pageNO = 1;
            [weakSelf headerRequestWithData];
        }];
    }
}
- (void)setIsOpenFooterRefresh:(BOOL)isOpenFooterRefresh
{
    if (_isOpenFooterRefresh == isOpenFooterRefresh) {
        return;
    }
    _isOpenFooterRefresh = isOpenFooterRefresh;
    WeakSelf(SHPBaseTableViewController);
    if (_isOpenFooterRefresh) {
        // 设置底部刷新
        self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            weakSelf.pageNO++;
            [weakSelf footerRequestWithData];
        }];
    }

    
}
- (TPKeyboardAvoidingTableView *)tableView {
    if (_tableView) {
        return _tableView;
    }
    _tableView = [[TPKeyboardAvoidingTableView alloc]initWithFrame:self.view.bounds style:_tableViewStyle];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor whiteColor];
    
    _tableView.tableFooterView = [UIView new];
    
    return _tableView;
}
- (NSMutableArray *)dataArray
{
    if (_dataArray) {
        return _dataArray;
    }
    _dataArray = @[].mutableCopy;
    return _dataArray;
}
- (id)initWithTableViewStyle:(UITableViewStyle)tableViewStyle
{
    self = [super init];
    if (!self) {
        return nil;
    }
    _tableViewStyle = tableViewStyle;
    return self;
    
}
- (void)endRefresh
{
    if (self.tableView.mj_header.isRefreshing) {
        [self.tableView.mj_header endRefreshing];
    }
    if (self.tableView.mj_footer.isRefreshing) {
        [self.tableView.mj_footer endRefreshing];
    }
}
# pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}
# pragma mark - UITableViewDelegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 0.1)];
    label.backgroundColor = [UIColor hexStringToColor:@"0xd9d9d9"];
    return label;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01;
}
// 子类需要实现的方法
- (void)headerRequestWithData
{
    
}
- (void)footerRequestWithData
{
    
}
@end


















































