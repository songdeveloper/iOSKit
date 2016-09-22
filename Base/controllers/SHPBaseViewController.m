//
//  SHPBaseViewController.m
//  developerKit
//
//  Created by songhuipan on 16/8/30.
//  Copyright © 2016年 songhuipan. All rights reserved.
//

#import "SHPBaseViewController.h"

@interface SHPBaseViewController ()<UINavigationControllerDelegate,UIGestureRecognizerDelegate>

@end

@implementation SHPBaseViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.delegate = self;
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    if ([self isMovingFromParentViewController])
    {
        if (self.navigationController.delegate == self)
        {
            self.navigationController.delegate = nil;
        }
        if (self.navigationController.interactivePopGestureRecognizer.delegate == self)
        {
            self.navigationController.interactivePopGestureRecognizer.delegate = nil;
        }
    }
    
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldBeRequiredToFailByGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    
    return [gestureRecognizer isKindOfClass:UIScreenEdgePanGestureRecognizer.class];
}

//- (void)loadView
//{
//    [super loadView];
//    _backgroundView = [[AGBackGroundView alloc]initWithFrame:self.view.bounds];
//    self.view = _backgroundView;
//}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self addBackNavItem];
    
}

- (void)addBackNavItem{
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 44, 44);
    [backButton setImage:[UIImage imageNamed:@"goback1"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(goBackAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    UIBarButtonItem *fixedSpace = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    [fixedSpace setWidth:-15];
    self.navigationItem.leftBarButtonItems = @[fixedSpace,leftItem];
    
}

- (void)goBackAction{
    // 这里已经解决了是正常弹出还是销毁的方式退出控制器
    if (!self.navigationController || ![self.navigationController popViewControllerAnimated:YES]) {
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)didSelectedBackButton {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent *)event {
    
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
# warning 当开始新项目的时候，这里要设置
// 导航栏，这里全局设置该基础类控制器管子类的navigationBar的显示与隐藏动画的问题
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if ([viewController class] == [UIViewController class]) {
        [navigationController setNavigationBarHidden:YES animated:animated];
    }else {
        [navigationController setNavigationBarHidden:NO animated:animated];
    }
}


@end
