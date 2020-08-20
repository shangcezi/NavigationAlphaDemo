//
//  QQnavViewController.m
//  CopyQQNav
//
//  Created by mac on 16/6/21.
//  Copyright © 2016年 PersonLiu. All rights reserved.
//
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
#import "QQnavViewController.h"
#import "UINavigationController+Rotation.h"

@interface QQnavViewController ()<UIScrollViewDelegate>

@property (strong ,nonatomic)UIScrollView *scroller;

@end

@implementation QQnavViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.title = @"第三页";
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [self buildScroller];  
}
-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    
 [self.navigationController setNavigationBarWithColors:@[RGBACOLOR(0, 0, 0, 0.87), RGBACOLOR(255, 255, 255, 0)]];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarWithColor:[UIColor magentaColor]];
}


-(void)buildScroller{
     _scroller = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
     _scroller.backgroundColor = [UIColor yellowColor];
    
     _scroller.contentSize = CGSizeMake(self.view.frame.size.width, 900);
   
     _scroller.delegate = self;
    
    UIImageView *sepView = [[UIImageView alloc]initWithFrame:CGRectMake(0, -64, self.view.frame.size.width, 264)];
    
    sepView.backgroundColor = [UIColor cyanColor];
    sepView.image = [UIImage imageNamed:@"baby.jpg"];
    
     [self.view addSubview:_scroller];
     [_scroller addSubview:sepView];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    if (scrollView.contentOffset.y >= 200-64) {
     
    [self.navigationController setNavigationBarWithColor:[UIColor magentaColor]];
  
    }else{
 
        [self.navigationController setNavigationBarWithColors:@[RGBACOLOR(0, 0, 0, 0.87), RGBACOLOR(255, 255, 255, 0)]];
    }

    NSLog(@"%lf",scrollView.contentOffset.y);
}

@end
