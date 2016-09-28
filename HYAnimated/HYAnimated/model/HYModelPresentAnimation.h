//
//  ModelPresentAnimation.h
//  HYAnimated
//
//  Created by wuhaoyuan on 16/7/5.
//  Copyright © 2016年 HYModel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, AnimatedModelPresnetStype) {
    /**
     *  弹性
     */
    ModelPresnetStypeElastic = 0,
    /**
     *  淡入淡出
     */
    ModelPresnetStypeFading,
};

/**
 *  模态
 */
@interface HYModelPresentAnimation : NSObject<UIViewControllerAnimatedTransitioning>


@property(nonatomic,assign)AnimatedModelPresnetStype animatedModelStype;
@end
