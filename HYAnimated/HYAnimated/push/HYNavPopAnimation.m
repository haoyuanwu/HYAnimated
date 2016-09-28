//
//  HYNavPopAnimation.m
//  HYAnimated
//
//  Created by wuhaoyuan on 2016/9/6.
//  Copyright © 2016年 HYModel. All rights reserved.
//

#import "HYNavPopAnimation.h"
#import "HYPopGesturesAnimation.h"

@implementation HYNavPopAnimation

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.25f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    UIViewController * fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController * toView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
     [[NSNotificationCenter defaultCenter] postNotificationName:@"navPopNotification" object:nil userInfo:nil];
    
//    CGRect finalFrameForVc = [transitionContext finalFrameForViewController:toView];
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    UIView *containerView = [transitionContext containerView];
    
    ///当缩放比例是0.9的时候证明直接调用了 pop 重置再进行pop
    if (toView.view.transform.a == 0.9) {
        toView.view.transform = CGAffineTransformIdentity;
        toView.view.frame = screenBounds;
        toView.view.transform = CGAffineTransformMakeScale(0.9, 0.9);
    }
    [containerView addSubview:toView.view];
    [containerView addSubview:fromView.view];
    
    NSTimeInterval durantion = [self transitionDuration:transitionContext];
    
    [UIView animateWithDuration:durantion animations:^{
        toView.view.transform = CGAffineTransformIdentity;
        fromView.view.transform = CGAffineTransformMakeTranslation(screenBounds.size.width, 0);
    } completion:^(BOOL finished) {
        
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];

}
@end
