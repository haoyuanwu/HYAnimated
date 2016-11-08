//
//  rootViewController.m
//  HYAnimated
//
//  Created by wuhaoyuan on 16/7/4.
//  Copyright © 2016年 HYModel. All rights reserved.
//

#import "UINMinforDetailsViewController.h"
#import "UINMInfoViewController.h"


/**
 计算线性函数的K(左倾斜)

 @param b          载距
 @param UpperLimit 上限
 @param lowerLimit 下限

 @return
 */
double get_K(double b,double UpperLimit,double lowerLimit);

double get_K(double b,double UpperLimit,double lowerLimit){
    double k = 0;
    
    k = (lowerLimit - b)/ UpperLimit;
    
    return k;
}


/**
 计算线性函数对应数值

 @param initValue 当前值
 @param k         斜率
 @param b         载距
 
 @return
 */
double get_Y(double initValue,double k,double b);

double get_Y(double initValue,double k,double b){
    double y = 0;
    
    y = initValue * k + b;
    
    return y;
}

@interface UINMinforDetailsViewController ()<UIViewControllerTransitioningDelegate,UINavigationControllerDelegate,UIScrollViewDelegate>
{
    UIImageView *imageV;
    UIImage *image;
    UIScrollView *bgScrollView;
    UILabel *label;
    NSString *desc;
}
@end

@implementation UINMinforDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    self.title = @"Article";
    
    bgScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, -20, self.view.frame.size.width, self.view.frame.size.height+20)];
    bgScrollView.delegate = self;
    
    self.view.layer.masksToBounds = YES;
    image = [UIImage imageNamed:@"mg_bananer"];
    imageV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    imageV.image = image;
    imageV.layer.masksToBounds = YES;
    imageV.contentMode = UIViewContentModeScaleAspectFill;
    [bgScrollView addSubview:imageV];
    
    [self.view addSubview:bgScrollView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(20, 40, 40, 40);
    button.layer.cornerRadius = button.frame.size.height/2;
    [button setTitle:@"<" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
    [button addTarget:self action:@selector(popViews) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    desc = @"   当我沉默着的时候，我觉得充实；我将开口，同时感到空虚。\n过去的生命已经死亡。我对于这死亡有大欢喜，因为我借此知道它曾经存活。\n死亡的生命已经朽腐。\n我对于这朽腐有大欢喜，因为我借此知道它还非空虚。\n生命的泥委弃在地面上，不生乔木，只生野草，这是我的罪过。\n野草，根本不深，花叶不美，然而吸取露，吸取水，吸取陈死人的血和肉，各各夺取它的生存。\n当生存时，还是将遭践踏，将遭删刈，直至于死亡而朽腐。\n但我坦然，欣然。\n我将大笑，我将歌唱。\n我自爱我的野草，但我憎恶这以野草作装饰的地面。\n地火在地下运行，奔突；熔岩一旦喷出，将烧尽一切野草，以及乔木，于是并且无可朽腐。\n但我坦然，欣然。\n我将大笑，我将歌唱。\n天地有如此静穆，我不能大笑而且歌唱。\n天地即不如此静穆，我或者也将不能。\n我以这一丛野草，在明与暗，生与死，过去与未来之际，献于友与仇，人与兽，爱者与不爱者之前作证。\n为我自己，为友与仇，人与兽，爱者与不爱者，我希望这野草的朽腐，火速到来。\n要不然，我先就未曾生存，这实在比死亡与朽腐更其不幸。\n去罢，野草，连着我的题辞！当我沉默着的时候，我觉得充实；我将开口，同时感到空虚。\n过去的生命已经死亡。我对于这死亡有大欢喜，因为我借此知道它曾经存活。\n死亡的生命已经朽腐。\n我对于这朽腐有大欢喜，因为我借此知道它还非空虚。\n生命的泥委弃在地面上，不生乔木，只生野草，这是我的罪过。\n野草，根本不深，花叶不美，然而吸取露，吸取水，吸取陈死人的血和肉，各各夺取它的生存。\n当生存时，还是将遭践踏，将遭删刈，直至于死亡而朽腐。\n但我坦然，欣然。\n我将大笑，我将歌唱。\n我自爱我的野草，但我憎恶这以野草作装饰的地面。\n地火在地下运行，奔突；熔岩一旦喷出，将烧尽一切野草，以及乔木，于是并且无可朽腐。\n但我坦然，欣然。\n我将大笑，我将歌唱。\n天地有如此静穆，我不能大笑而且歌唱。\n天地即不如此静穆，我或者也将不能。\n我以这一丛野草，在明与暗，生与死，过去与未来之际，献于友与仇，人与兽，爱者与不爱者之前作证。\n为我自己，为友与仇，人与兽，爱者与不爱者，我希望这野草的朽腐，火速到来。\n要不然，我先就未曾生存，这实在比死亡与朽腐更其不幸。\n去罢，野草，连着我的题辞！";
    label = [[UILabel alloc] init];
    label.alpha = 0;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.text = desc;
    label.numberOfLines = 0;
    label.font = [UIFont systemFontOfSize:15];
    [bgScrollView addSubview:label];
    
    [UIView animateWithDuration:0.25 animations:^{
        imageV.transform = CGAffineTransformMakeScale(1.3, 1.3);
        CGRect rect = imageV.frame;
        rect.origin = CGPointMake(-image.size.width/4, 0);
        rect.size = CGSizeMake(image.size.width, image.size.height);
        imageV.frame = rect;
        label.frame = CGRectMake(20, imageV.frame.size.height, self.view.frame.size.width-40, [self textHeight:desc]);
    } completion:^(BOOL finished) {
        label.alpha = 1;
        bgScrollView.contentSize = CGSizeMake(self.view.frame.size.width, label.frame.origin.y + label.frame.size.height - 64);
    }];
}

- (void)popViews{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

//滑动触发
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

    CGFloat k = get_K(0,image.size.height,1);
    NSLog(@"%f",k);
    CGFloat scale = get_Y(scrollView.contentOffset.y, k, 0);
    NSLog(@"%f",scale);
    imageV.transform = CGAffineTransformMakeScale(1-scale,1-scale);
    
    label.transform = CGAffineTransformMakeTranslation(0, -scrollView.contentOffset.y/2);
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    [UIView animateWithDuration:0.25 animations:^{
        imageV.transform = CGAffineTransformMakeScale(1, 1);
        CGRect rect = imageV.frame;
        rect.origin = CGPointMake(0, 0);
        rect.size = CGSizeMake(self.view.frame.size.width, 200);
        imageV.frame = rect;
    } completion:^(BOOL finished) {
        
    }];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (CGFloat)textHeight:(NSString *)text{
    CGRect rect = [text boundingRectWithSize:CGSizeMake(label.frame.size.width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
    return rect.size.height + 200;
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
