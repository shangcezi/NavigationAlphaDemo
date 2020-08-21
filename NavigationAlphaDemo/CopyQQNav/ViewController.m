//
//  ViewController.m
//  CopyQQNav
//
//  Created by mac on 16/6/17.
//  Copyright © 2016年 PersonLiu. All rights reserved.
//

#import "ViewController.h"
#import "SecondController.h"
#import "ThirdController.h"
#import "QQnavViewController.h"
#import "UINavigationController+Rotation.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    
    [self.navigationController setNavigationBarWithColor:[UIColor magentaColor]];
    [[UINavigationBar appearance] setTranslucent:YES];
    
   
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-50, self.view.frame.size.height/2-25, 100, 50)];
    [button setBackgroundColor: [UIColor cyanColor]];
    [button setTitle:@"仿qq 1" forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *button2 = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-50, CGRectGetMaxY(button.frame)+30, 100, 50)];
    [button2 setBackgroundColor: [UIColor cyanColor]];
    [button2 setTitle:@"仿qq 2" forState:UIControlStateNormal];
    button2.tag = 2;
    [button2 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    NSLog(@"111111");
    NSLog(@"44444");
    NSLog(@"777777");
    NSLog(@"66666");
    NSLog(@"55555");
}


-(void)buttonClick:(UIButton *)sender{
    if (sender.tag == 2) {
        QQnavViewController *VC = [QQnavViewController new];
        [self.navigationController pushViewController:VC  animated:YES];
    }else{
    SecondController *secondController = [[SecondController alloc]init];
    [self.navigationController pushViewController:secondController animated:YES];
    }
    
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
