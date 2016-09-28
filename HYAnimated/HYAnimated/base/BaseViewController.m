//
//  BaseViewController.m
//  HYAnimated
//
//  Created by wuhaoyuan on 2016/9/6.
//  Copyright © 2016年 HYModel. All rights reserved.
//

#import "BaseViewController.h"
#import "HYModelPresentAnimation.h"
#import "HYModelDismissAnimation.h"
#import "HYNavPushAnimation.h"
#import "HYNavPopAnimation.h"

@interface BaseViewController ()

@property(nonatomic,strong)HYModelPresentAnimation *modelPresentAnimation;
@property(nonatomic,strong)HYModelDismissAnimation *modelDismissAnimation;
@property(nonatomic,strong)HYNavPushAnimation *navPushAnimation;
@property(nonatomic,strong)HYNavPopAnimation *navPopAnimation;

@end

@implementation BaseViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        _modelPresentAnimation = [[HYModelPresentAnimation alloc] init];
        _modelPresentAnimation.animatedModelStype = ModelPresnetStypeFading;
        _modelDismissAnimation = [[HYModelDismissAnimation alloc] init];
        _modelDismissAnimation.animatedModelStype = ModelDismissStypeFading;
        _navPushAnimation = [[HYNavPushAnimation alloc] init];
        _navPopAnimation = [[HYNavPopAnimation alloc] init];
    
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return self.modelPresentAnimation;
}

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return self.modelDismissAnimation;
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC{
    
    if (operation == UINavigationControllerOperationPush){
        return self.navPushAnimation;
    }else if (operation == UINavigationControllerOperationPop) {
        return self.navPopAnimation;
    }else{
        return nil;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
