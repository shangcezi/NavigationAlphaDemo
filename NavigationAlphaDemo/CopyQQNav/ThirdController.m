//
//  ThirdController.m
//  CopyQQNav
//
//  Created by mac on 16/6/20.
//  Copyright © 2016年 PersonLiu. All rights reserved.
//

#import "ThirdController.h"
#import "SlideSwitchView.h"
#import "AIMultiDelegate.h"
@interface ThirdController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong ,nonatomic) UITableView *myTableView;

@property (strong ,nonatomic) NSMutableArray *dataArray;

@property (nonatomic, strong)SlideSwitchView *slideSwitchView;

@property (nonatomic, strong)AIMultiDelegate *multiDelegate;
@end

@implementation ThirdController

-(instancetype)initWithSliderController:(SlideSwitchView *)slideSwithView{

    self = [super init];
    if (self) {
        _slideSwitchView = slideSwithView;
    }

    return self;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];

    _dataArray = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",nil];
    
    UITableView *myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width,800)];
    
    myTableView.backgroundColor = [UIColor yellowColor];
    
    myTableView.delegate = self;
    myTableView.dataSource = self;
    
    _myTableView = myTableView;
    [self.view addSubview:myTableView];
    
    
    if (_slideSwitchView) {
        _multiDelegate = [[AIMultiDelegate alloc] init];
        [_multiDelegate addDelegate:self];
        [_multiDelegate addDelegate:_slideSwitchView];
        self.myTableView.delegate = (id)_multiDelegate;
    }
 
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return _dataArray.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [UITableViewCell new];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.textLabel.text = _dataArray[indexPath.row];
    
    return cell;

}




@end
