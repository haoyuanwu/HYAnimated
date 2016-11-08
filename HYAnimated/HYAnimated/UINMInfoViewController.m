//
//  ViewController.m
//  HYAnimated
//
//  Created by wuhaoyuan on 16/7/4.
//  Copyright © 2016年 HYModel. All rights reserved.
//

#import "UINMInfoViewController.h"
#import "UINMinforDetailsViewController.h"
#import "HYModelPresentAnimation.h"
#import "HYModelDismissAnimation.h"
#import "HYNavPushAnimation.h"
#import "HYNavPopAnimation.h"
#import "ILMLicenseTableViewCell.h"

@interface UINMInfoViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@property(nonatomic,strong)HYModelPresentAnimation *modelPresentAnimation;
@property(nonatomic,strong)HYModelDismissAnimation *modelDismissAnimation;
@property(nonatomic,strong)HYNavPushAnimation *navPushAnimation;
@property(nonatomic,strong)HYNavPopAnimation *navPopAnimation;
@end

@implementation UINMInfoViewController

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
    
    self.title = @"List";
    
    self.navigationController.delegate = self;

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 100);
    [button setTitle:@"present" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(present) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    [self.view addSubview:self.tableView];
    
}

- (void)present{
    rootViewController *root = [[rootViewController alloc] init];
    root.transitioningDelegate = self;
    [self.navigationController pushViewController:root animated:YES];
//    [self presentViewController:root animated:YES completion:nil];
    
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 200;
        _tableView.backgroundColor = [UIColor blackColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[ILMLicenseTableViewCell class] forCellReuseIdentifier:@"cellid"];
    }
    return _tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20)];
    view.backgroundColor = [UIColor blackColor];
    
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, view.frame.size.width, 44)];
    textLabel.textColor = [UIColor whiteColor];
    textLabel.font = [UIFont systemFontOfSize:15];
    textLabel.textAlignment = NSTextAlignmentCenter;
    textLabel.text = [NSString stringWithFormat:@"标题%ld",section];
    [view addSubview:textLabel];
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 64;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ILMLicenseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellid" forIndexPath:indexPath];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    CGRect rectInTableView = [tableView rectForRowAtIndexPath:indexPath];
    CGRect rect = [tableView convertRect:rectInTableView toView:[tableView superview]];
    self.navPushAnimation.viewBounds = rect;
    self.navPopAnimation.viewBounds = rect;
    UINMinforDetailsViewController *inforDetails = [[UINMinforDetailsViewController alloc] init];
    inforDetails.transitioningDelegate = self;
    [self.navigationController pushViewController:inforDetails animated:YES];
    //    [self presentViewController:root animated:YES completion:nil];
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

@end
