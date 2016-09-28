//
//  ModelDismissAnimation.h
//  HYAnimated
//
//  Created by wuhaoyuan on 16/7/5.
//  Copyright © 2016年 HYModel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, AnimatedModelDismissStype) {
    /**
     *  弹性
     */
    ModelDismissStypeElastic = 0,
    /**
     *  淡入淡出
     */
    ModelDismissStypeFading,
};
/**
 *  模态
 */
@interface HYModelDismissAnimation : NSObject<UIViewControllerAnimatedTransitioning>

@property(nonatomic,assign)AnimatedModelDismissStype animatedModelStype;
@end
