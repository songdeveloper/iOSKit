//
//  Base_Macros.h
//  HealthHome_iPhoneOS
//
//  Created by songhuipan on 16/9/1.
//  Copyright © 2016年 GaoHang. All rights reserved.
//

#ifndef Base_Macros_h
#define Base_Macros_h

#import "WEHelper.h"
//#import "HYBNetworking.h"
#import "Network_Interface.h"
//#import "YYModel.h"

// 打印相关的宏-----------------------------------------------------------------
// 第一种
#ifdef __OBJC__

#ifdef DEBUG
#define NSLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
#else
#define NSLog(...)
#endif

#endif
// 第二种
#ifdef DEBUG

#define DLog( s, ... ) NSLog( @"< %@:(%d) > %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )

#else

#define DLog( s, ... )

#endif
// -----------------------------------------------------------------------------------
// 获取设备的frame值
#define ScreenFrame [UIScreen mainScreen].bounds
//获取设备的物理高度
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
//获取设备的物理宽度
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
//设备系统版本号
#define kDeviceVersion [[[UIDevice currentDevice] systemVersion] floatValue]

// 颜色(RGB)--------------------------------------------------------------------------
#define RGBCOLOR(r, g, b)       [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.0]
// 颜色（16进制）
#define COLOR(value)    [UIColor colorWithHexString:(value)]

#define AppThemeColor RGBCOLOR(79, 145, 225)

// ---------------------------------------------------------------------------------------




#endif /* Base_Macros_h */
