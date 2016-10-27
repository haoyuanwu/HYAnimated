//
//  HYNavPushAnimation.m
//  HYAnimated
//
//  Created by wuhaoyuan on 2016/9/6.
//  Copyright © 2016年 HYModel. All rights reserved.
//

#import "HYNavPushAnimation.h"
#import "HYPopGesturesAnimation.h"

@interface HYNavPushAnimation ()<UINavigationControllerDelegate>

@property (nonatomic,strong)HYPopGesturesAnimation *popGesturesAinmation;
@end

@implementation HYNavPushAnimation

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext{
    return 0.25;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    UIViewController *fromVc = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toView = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    // 2. 添加视同控制器到容器视图
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toView.view];
    
//    [[HYPopGesturesAnimation singletion] getToView:toView fromView:fromVc containerView:(UIView *)containerView];
    
    // 3. 设置视同控制器的大小位置
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
//    CGRect finalFrame = [transitionContext finalFrameForViewController:toView];
    
    NSTimeInterval durantion = [self transitionDuration:transitionContext];
    
    fromVc.view.frame = screenBounds;
    toView.view.frame = self.viewBounds;
//    toView.view.transform = CGAffineTransformMakeScale(0.9, 0.9);
//    toView.view.transform = CGAffineTransformMakeTranslation(screenBounds.size.width, 0);
    
//    [UIView animateWithDuration:durantion delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:0.25 options:UIViewAnimationOptionCurveEaseOut animations:^{
//        toView.view.frame = screenBounds;
//        toView.view.transform = CGAffineTransformIdentity;
//        fromVc.view.transform = CGAffineTransformMakeScale(0.9,0.9);
//    } completion:^(BOOL finished) {
//        [transitionContext completeTransition:YES];
//    }];
    
    [UIView animateWithDuration:durantion animations:^{
        toView.view.frame = screenBounds;
        toView.view.transform = CGAffineTransformIdentity;
//        fromVc.view.transform = CGAffineTransformMakeScale(0.9,0.9);

    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];

}

- (HYPopGesturesAnimation *)popGesturesAinmation{
    if (!_popGesturesAinmation) {
        _popGesturesAinmation = [[HYPopGesturesAnimation alloc] init];
    }
    return _popGesturesAinmation;
}

@end
