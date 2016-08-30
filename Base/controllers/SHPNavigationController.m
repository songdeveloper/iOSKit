//
//  SHPNavigationController.m
//  developerKit
//
//  Created by songhuipan on 16/8/30.
//  Copyright © 2016年 songhuipan. All rights reserved.
//

#import "SHPNavigationController.h"
#import "WEHelper.h"
@interface SHPNavigationController ()

@end

@implementation SHPNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationBar.tintColor = [UIColor whiteColor];
    
    // 设置导航栏的背景颜色
    //    self.navigationBar.barTintColor = [UIColor hexStringToColor:@"#f4f4f4"];
    [self.navigationBar setBarTintColor:[UIColor redColor]];
    
    //移除bar下的线（阴影）
    [[[[self.navigationBar.subviews objectAtIndex:0] subviews] objectAtIndex:0] removeFromSuperview];
    //    self.navigationBar.translucent = NO;
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor],NSFontAttributeName: [UIFont boldSystemFontOfSize:18]};
    //线
    UIView * lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 43.5, [UIScreen mainScreen].bounds.size.width, 0.5)];
    lineView.backgroundColor = [UIColor hexStringToColor:@"#bfbfbf"];
    
    [self.navigationBar addSubview:lineView];


}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
