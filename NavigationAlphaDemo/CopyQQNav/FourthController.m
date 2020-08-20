//
//  FourthController.m
//  CopyQQNav
//
//  Created by mac on 16/6/22.
//  Copyright © 2016年 PersonLiu. All rights reserved.
//

#import "FourthController.h"
#import "SlideSwitchView.h"
#import "AIMultiDelegate.h"
@interface FourthController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong ,nonatomic) UITableView *myTableView;

@property (strong ,nonatomic) NSMutableArray *dataArray;

@property (nonatomic, strong)SlideSwitchView *slideSwitchView;

@property (nonatomic, strong)AIMultiDelegate *multiDelegate;

@end
@implementation FourthController

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

    _dataArray = [NSMutableArray arrayWithObjects:@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"j",@"k",@"l",@"t",nil];
    
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
    cell.backgroundColor = [UIColor lightGrayColor];
    
    return cell;
    
}

@end
