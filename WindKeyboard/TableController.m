//
//  TableController.m
//  WindKeyboard
//
//  Created by 廖磊 on 2017/8/24.
//  Copyright © 2017年 东边的风. All rights reserved.
//

#import "TableController.h"

#import "WindyKeyBoard.h"

#import "TableCell.h"

@interface TableController ()<WindyKeyBoardDelegate,UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong)WindyKeyBoard *keyBoard;

@end

@implementation TableController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self initView];
    
    [self keyBoradAction];
    
}

-(void)initView{
    
    UITableView *tbView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WD, HG)];
    
    tbView.dataSource = self;
    
    tbView.delegate = self;
    
    tbView.rowHeight = 45;
    
    tbView.tableFooterView = [UIView new];
    
    [tbView registerClass:[TableCell class] forCellReuseIdentifier:@"cell"];
    
    [self.view addSubview:tbView];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textFeld.text = [NSString stringWithFormat:@"第%ld个cell",indexPath.row];
    return cell;
}

-(UITextField *)creatTextField{
    
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 200, 30)];
    textField.backgroundColor = [UIColor orangeColor];
    return textField;
}

-(void)keyBoradAction{
    _keyBoard = [[WindyKeyBoard alloc]init];
    _keyBoard.isSuitable = YES;
    _keyBoard.delegate = self;
}


#pragma mark - KeyBoard
-(void)WindyKeyBoard:(BOOL)isUp withNotification:(NSNotification *)notifi{
}
-(void)WindyKeyBoardBtnClick:(UIButton *)btn{
}
@end
