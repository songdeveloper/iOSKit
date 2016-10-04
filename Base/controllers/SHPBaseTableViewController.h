//
//  SHPBaseTableViewController.h
//  测试代码
//
//  Created by songhuipan on 16/10/2.
//  Copyright © 2016年 songhuipan. All rights reserved.
//

#import "SHPBaseViewController.h"

@interface SHPBaseTableViewController : SHPBaseViewController<UITableViewDataSource,UITableViewDelegate>

// 页数索引
@property (nonatomic,assign)NSInteger pageNO;
// 每页显示多少条
@property (nonatomic,assign)NSInteger pageSize;
// 是否还有没有显示的数据
@property (nonatomic,assign,readonly)BOOL isEndForLoadmore;
// 数据源
@property (nonatomic,strong)NSMutableArray *dataArray;

@property (nonatomic,strong,readonly)UITableView *tableView;

// 开启头部刷新
@property (nonatomic,assign)BOOL isOpenHeaderRefresh;
// 开启底部刷新
@property (nonatomic,assign)BOOL isOpenFooterRefresh;

// 根据tableView样式创建tableView
- (id)initWithTableViewStyle:(UITableViewStyle)tableViewStyle;
// 停止刷新
- (void)endRefresh;

// 头部刷新请求（子类需重写)
- (void)headerRequestWithData;
// 脚部刷新请求 (子类需重写)
- (void)footerRequestWithData;


@end









































































































