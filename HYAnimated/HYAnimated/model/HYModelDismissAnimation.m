//
//  ModelDismissAnimation.m
//  HYAnimated
//
//  Created by wuhaoyuan on 16/7/5.
//  Copyright © 2016年 HYModel. All rights reserved.
//

#import "HYModelDismissAnimation.h"

@implementation HYModelDismissAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.5f;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    // 1. 获取视图上下文
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    // 2. 添加新的视图到视同容器 删除当前视图容器视图
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    [containerView sendSubviewToBack:toVC.view];
    
    // 2. 设置初始化位置大小
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGRect initFrame = [transitionContext initialFrameForViewController:fromVC];
    CGRect finalFrame = CGRectOffset(initFrame, 0, 0);
    fromVC.view.frame = finalFrame;
    
    switch (self.animatedModelStype) {
        case ModelDismissStypeElastic:
        {
            // 4. 动画过程
            NSTimeInterval duration = [self transitionDuration:transitionContext];
            [UIView animateWithDuration:duration animations:^{
                fromVC.view.transform = CGAffineTransformMakeTranslation(0, screenBounds.size.height);
            } completion:^(BOOL finished) {
                [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            }];
        }
            break;
        case ModelDismissStypeFading:
        {
            // 4. 动画过程
            NSTimeInterval duration = [self transitionDuration:transitionContext];
            [UIView animateWithDuration:duration animations:^{
                fromVC.view.transform = CGAffineTransformMakeScale(1.2, 1.2);
                fromVC.view.alpha = 0;
            } completion:^(BOOL finished) {
                [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            }];
        }
            break;
        
        default:
            break;
    }
    
    
    

}
@end
