//
//  HYPopGesturesAnimation.m
//  HYAnimated
//
//  Created by wuhaoyuan on 2016/9/6.
//  Copyright © 2016年 HYModel. All rights reserved.
//

#import "HYPopGesturesAnimation.h"

double getK(double min,double max,double x,double y);
//x = 0.9 y = 1 min = 0 max = width (y=kx+b) 求K
double getK(double min,double max,double x,double y) {
    
    double k = 0;
    double b = 0;
    if (min == 0) {
        x = 0.9;
        b = x;
    }
    k = (1-0.9)/max;
    return k;
}

double getY(double pointX,double k,double b);
double getY(double pointX,double k,double b){
    
    double y = pointX*k + b;
    
    return y;
}

@interface HYPopGesturesAnimation ()

@property(nonatomic,weak) UIViewController *fromView;
@property(nonatomic,weak) UIViewController *toView;
@property(nonatomic,weak) UIView *conentView;
@property(nonatomic,strong) UIView *navView;
@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *interactivePopTransition;
@end

@implementation HYPopGesturesAnimation

+ (HYPopGesturesAnimation *)singletion{
    static HYPopGesturesAnimation *obj = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        obj = [[HYPopGesturesAnimation alloc]init];
    });
    return obj;
}

- (void)getToView:(UIViewController *)toView fromView:(UIViewController *)fromView containerView:(UIView *)containerView{
    [self addSwipeGestures:toView.view];
    _fromView = fromView;
    _toView = toView;
    _conentView = containerView;
//    _toView.navigationController.tit
}

- (void)addSwipeGestures:(UIView *)view{
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(swipePop:)];
    [view addGestureRecognizer:pan];
}

- (void)swipePop:(UIPanGestureRecognizer *)sender{
    CGPoint point = [sender translationInView:_toView.view];
    CGPoint velocityPoint = [sender velocityInView:_toView.view];
    
    CGRect screenBounds = [UIScreen mainScreen].bounds;
    double k = getK(0, screenBounds.size.width, 0.9, 1);
    double scale = getY(point.x, k, 0.9);
    if (sender.state == UIGestureRecognizerStateBegan) {
        
        [_conentView addSubview:_fromView.view];
        [_conentView bringSubviewToFront:_toView.view];
        
    }else if (sender.state == UIGestureRecognizerStateChanged) {
        if (point.x > 0) {
            _toView.view.transform = CGAffineTransformMakeTranslation(point.x, 0);
            _fromView.view.transform = CGAffineTransformMakeScale(scale, scale);
        }
    }else if(sender.state == UIGestureRecognizerStateEnded) {
        
        if (velocityPoint.x > 0) {
            [UIView animateWithDuration:0.25 animations:^{
                _toView.view.transform = CGAffineTransformMakeTranslation(screenBounds.size.width, 0);
                _fromView.view.transform = CGAffineTransformMakeScale(1,1);
            }completion:^(BOOL finished) {
                [_toView.navigationController popViewControllerAnimated:YES];
            }];
        }else{
            [UIView animateWithDuration:0.25 animations:^{
                _toView.view.transform = CGAffineTransformIdentity;
                _fromView.view.transform = CGAffineTransformMakeScale(0.9,0.9);
            }completion:^(BOOL finished) {
                [_conentView willRemoveSubview:_fromView.view];
            }];
        }
    }
}

@end
