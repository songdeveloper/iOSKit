//
//  SHPBaseTableViewController.h
//  测试代码
//
//  Created by songhuipan on 16/9/22.
//  Copyright © 2016年 songhuipan. All rights reserved.
//

#import "SHPBaseViewController.h"

@interface SHPBaseTableViewController : SHPBaseViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)UITableView *tableView;

@end
