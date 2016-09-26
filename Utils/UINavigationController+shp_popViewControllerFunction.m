//
//  UINavigationController+shp_popViewControllerFunction.m
//  测试代码
//
//  Created by songhuipan on 16/9/26.
//  Copyright © 2016年 songhuipan. All rights reserved.
//
#import <objc/runtime.h>
#import "UINavigationController+shp_popViewControllerFunction.h"

@implementation UINavigationController (shp_popViewControllerFunction)

+(void)load {
    
    Method popMethod = class_getInstanceMethod([self class], @selector(popViewControllerAnimated:));
    
    Method KK_popMethod = class_getInstanceMethod([self class], @selector(shp_popViewControllerAnimated:));
    
    method_exchangeImplementations(popMethod, KK_popMethod);
    
}
- (nullable UIViewController *)shp_popViewControllerAnimated:(BOOL)animated {
    
    if (![self.navigationController shp_popViewControllerAnimated:animated]) {
        
        [self dismissViewControllerAnimated:YES completion:nil];
        return self.navigationController;
        
    }else {
        
        return [self.navigationController shp_popViewControllerAnimated:animated];
    }
    
    
    
}

@end
