//
//  SecondController.m
//  CopyQQNav
//
//  Created by mac on 16/6/17.
//  Copyright © 2016年 PersonLiu. All rights reserved.
//
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#import "SecondController.h"
#import "SlideSwitchView.h"
#import "ThirdController.h"
#import "FourthController.h"
#import "UINavigationController+Rotation.h"
@interface SecondController ()<SlideSwitchViewDelegate>

//判断当前是否在上面
@property (assign ,nonatomic) BOOL isTop;

@property (strong ,nonatomic) UIImageView *topView;

@property (strong ,nonatomic) SlideSwitchView *downView;

@property (strong ,nonatomic) ThirdController  *thirdController;
@property (strong ,nonatomic) FourthController *fourthController;

@property (strong ,nonatomic) UIScrollView *scorller;


@end

@implementation SecondController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"第二页";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _thirdController = [[ThirdController alloc]initWithSliderController:_downView];
    _thirdController.title = @"第三滴血";
    
    _fourthController = [[FourthController alloc]initWithSliderController:_downView];
    _fourthController.title = @"第四滴血";
    
    [_downView buildUI];
    self.isTop = NO;

}

-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
   if (!_isTop) {

        [self.navigationController setNavigationBarWithColors:@[RGBACOLOR(0, 0, 0, 1.0), RGBACOLOR(255, 255, 255, 0)]];
    }

}
- (void)loadView
{
    
    [super loadView];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    _topView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width*244/320)];
    _topView.backgroundColor = [UIColor lightGrayColor];
    _topView.image = [UIImage imageNamed:@"baby.jpg"];
    [self.view addSubview:_topView];
    
    _downView = [[SlideSwitchView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_topView.frame), self.view.frame.size.width, [UIScreen mainScreen].bounds.size.height-_topView.frame.size.height)];
    _downView.slideSwitchViewDelegate = self;

    _downView.topScrollView.backgroundColor = [UIColor whiteColor];
    _downView.tabItemNormalColor   = [UIColor magentaColor];
    _downView.tabItemSelectedColor = [UIColor redColor];
    _downView.shadowImage = [UIImage imageNamed:@"nil"];
    [self.view addSubview:_downView];
}
-(void)viewWillDisappear:(BOOL)animated{

    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarWithColor:nil];
    

}
#pragma marking-----slideViewDelegate
- (NSUInteger)numberOfTab:(SlideSwitchView *)view
{
    return 2;
}

- (UIViewController *)slideSwitchView:(SlideSwitchView *)view viewOfTab:(NSUInteger)number
{
    if(number == 0){
    
        return _thirdController;
    }else{
    
        return _fourthController;
    }
}

- (void)slideSwitchViewSubVCDragUp:(SlideSwitchView *)view
{
    if (_isTop) {
        return;
    }
    [UIView animateWithDuration:0.6 animations:^{
        self.topView.frame = CGRectMake(0, -self.topView.frame.size.height, self.view.frame.size.width, _topView.frame.size.height);
        self.downView.frame = CGRectMake(0, 0, self.view.frame.size.width,[UIScreen mainScreen].bounds.size.height-self.navigationController.navigationBar.frame.size.height);
    } completion:^(BOOL finished) {
        [self.navigationController setNavigationBarWithColor:[UIColor magentaColor]];
        _isTop = YES;
        [self.view layoutIfNeeded];
        [self.view setNeedsLayout];
    }];
}
- (void)slideSwitchViewSubVCDragDown:(SlideSwitchView *)view
{
    _isTop = NO;
    self.edgesForExtendedLayout = UIRectEdgeAll;
    
    self.automaticallyAdjustsScrollViewInsets = YES;
    
    [self.navigationController setNavigationBarWithColors:@[RGBACOLOR(0, 0, 0, 0.87), RGBACOLOR(255, 255, 255, 0)]];
    
    [UIView animateWithDuration:0.2 animations:^{
        self.topView.frame = CGRectMake(0, -64, self.view.frame.size.width, self.topView.frame.size.height);
        self.downView.frame = CGRectMake(0, CGRectGetMaxY(_topView.frame), self.view.frame.size.width, self.view.frame.size.height-self.topView.frame.size.height);
    } completion:^(BOOL finished) {
        
        [self.view layoutIfNeeded];
        [self.view setNeedsLayout];
        
    }];
}



-(void)viewWillLayoutSubviews{

    if (_isTop) {
        if (self.view.frame.origin.y == 0 && [_downView convertRect:_downView.frame toView:[UIApplication sharedApplication].keyWindow].origin.y == 0) {
            self.view.frame = CGRectMake(0,
                                         [UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.frame.size.height,
                                         self.view.frame.size.width,
                                         [UIScreen mainScreen].bounds.size.height - self.navigationController.navigationBar.frame.size.height);
        }
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.automaticallyAdjustsScrollViewInsets = NO;
     
    } else {
        self.edgesForExtendedLayout = UIRectEdgeAll;
        self.automaticallyAdjustsScrollViewInsets = YES;
    }


}
@end
