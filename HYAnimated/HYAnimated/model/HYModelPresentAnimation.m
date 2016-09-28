//
//  ModelPresentAnimation.m
//  HYAnimated
//
//  Created by wuhaoyuan on 16/7/5.
//  Copyright © 2016年 HYModel. All rights reserved.
//

#import "HYModelPresentAnimation.h"

@implementation HYModelPresentAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return  0.8f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    // 1. 获取视同控制器的上下文
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    // 2. 添加视同控制器到容器视图
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    // 3. 设置视同控制器的大小位置
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
    
    NSTimeInterval durantion = [self transitionDuration:transitionContext];
    
    switch (self.animatedModelStype) {
        case ModelPresnetStypeElastic:
        {
            toVC.view.frame = CGRectOffset(finalFrame, 0, screenBounds.size.height);
            
            [UIView animateWithDuration:durantion
                                  delay:0.0
                 usingSpringWithDamping:0.6
                  initialSpringVelocity:0.0
                                options:UIViewAnimationOptionCurveLinear
                             animations:^{
                                 toVC.view.transform = CGAffineTransformMakeTranslation(0, -screenBounds.size.height);
                             } completion:^(BOOL finished) {
                                 [transitionContext completeTransition:YES];
                             }];
        }
            break;
        case ModelPresnetStypeFading:
        {
            toVC.view.alpha = 0;
            toVC.view.frame = CGRectOffset(finalFrame, 0, 0);
            toVC.view.transform = CGAffineTransformMakeScale(1.2, 1.2);
            
            [UIView animateWithDuration:durantion
                                  delay:0.0
                 usingSpringWithDamping:1.0
                  initialSpringVelocity:0.0
                                options:UIViewAnimationOptionCurveLinear
                             animations:^{
                                 toVC.view.transform = CGAffineTransformMakeScale(1, 1);
                                 toVC.view.alpha = 1;
                             } completion:^(BOOL finished) {
                                 [transitionContext completeTransition:YES];
                             }];
            
        }
            break;
        default:
            break;
    }

}


@end
