//
//  UINavigationController+backRecognizer.h
//  buka
//
//  Created by songhuipan on 16/7/7.
//  Copyright © 2016年 songhuipan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (backRecognizer)
/**
 *  自定义全屏返回手势
 */
@property (nonatomic,strong,readonly)UIGestureRecognizer *shp_popGestureRecognizer;

@end
