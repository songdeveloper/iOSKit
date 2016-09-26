//
//  UIViewController+KK_popViewController.m
//  KKNewHealth
//
//  Created by songhuipan on 16/9/23.
//  Copyright © 2016年 kk. All rights reserved.
//

#import "UIViewController+KK_popViewController.h"
#import <objc/runtime.h>


@implementation UIViewController (KK_popViewController)

+(void)load {
    
    Method popMethod = class_getClassMethod([self class], @selector(popViewControllerAnimated:));
    Method KK_popMethod = class_getClassMethod([self class], @selector(KK_popViewControllerAnimated:));
    
    method_exchangeImplementations(popMethod, KK_popMethod);
    
}
- (void)KK_popViewControllerAnimated:(BOOL)animated {
    
    if (![self.navigationController popViewControllerAnimated:YES] || ![self.navigationController popViewControllerAnimated:NO]) {
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}
@end
