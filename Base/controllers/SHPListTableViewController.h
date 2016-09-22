//
//  SHPListTableViewController.h
//  测试代码
//
//  Created by songhuipan on 16/9/22.
//  Copyright © 2016年 songhuipan. All rights reserved.
//

#import "SHPBaseTableViewController.h"

@interface SHPListTableViewController : SHPBaseTableViewController
/// 页大小
@property (nonatomic,assign)NSInteger pageSize;
/// 页码
@property (nonatomic,assign)NSInteger pageNum;
/// 没有数据了
@property (nonatomic,assign)BOOL isHaveNoneData;
/// 网络错误
@property (nonatomic,assign)BOOL isNetworkError;
/// 正在加载数据
@property (nonatomic,assign)BOOL isLoading;
/// 数据数组
@property (nonatomic,strong)NSMutableArray *dataArray;

@end


















































