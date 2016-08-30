//
//  SHPBaseViewController.h
//  developerKit
//
//  Created by songhuipan on 16/8/30.
//  Copyright © 2016年 songhuipan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHPBackgroundView.h"

@interface SHPBaseViewController : UIViewController

@property (nonatomic,strong)SHPBackgroundView *backgroundView;

- (void)didSelectedBackButton;

@end
