//
//  SubViewController.m
//  WindKeyboard
//
//  Created by 廖磊 on 2017/8/24.
//  Copyright © 2017年 东边的风. All rights reserved.
//

#import "SubViewController.h"
#import "WindyKeyBoard.h"

@interface SubViewController ()<WindyKeyBoardDelegate>
@property (nonatomic,strong)WindyKeyBoard *keyBoard;

@end

@implementation SubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
    [self keyBoradAction];
}
-(void)initView{
    
    UIView *subViewF = [self creatView:CGRectMake(10, 350, WD - 20, 400) withColor:[UIColor greenColor]];
    [self.view addSubview:subViewF];
    
    UIView *subViewS = [self creatView:CGRectMake(10, 100, subViewF.wide - 20, subViewF.height - 200) withColor:[UIColor blueColor]];
    [subViewF addSubview:subViewS];
    
    UIView *subViewT = [self creatView:CGRectMake(10, 10, subViewS.wide - 20, 100) withColor:[UIColor redColor]];
    [subViewS addSubview:subViewT];
    
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(10, 50, subViewT.wide - 20, 30)];
    textField.placeholder = @"点我";
    textField.backgroundColor = [UIColor orangeColor];
    [subViewT addSubview:textField];
    
}
-(UIView *)creatView:(CGRect)frame withColor:(UIColor *)color{
    UIView *view = [[UIView alloc]initWithFrame:frame];
    view.backgroundColor = color;
    return view;
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
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
@end
