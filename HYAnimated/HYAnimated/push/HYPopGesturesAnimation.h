//
//  HYPopGesturesAnimation.h
//  HYAnimated
//
//  Created by wuhaoyuan on 2016/9/6.
//  Copyright © 2016年 HYModel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HYPopGesturesAnimation : NSObject

+ (HYPopGesturesAnimation *)singletion;

- (void)getToView:(UIViewController *)view fromView:(UIViewController *)fromView containerView:(UIView *)containerView;
@end
