//
//  TextFieldInViewController.m
//  WindKeyboard
//
//  Created by 廖磊 on 2017/8/23.
//  Copyright © 2017年 东边的风. All rights reserved.
//

#import "TextFieldInViewController.h"
#import "WindyKeyBoard.h"

@interface TextFieldInViewController ()<WindyKeyBoardDelegate>

@property (nonatomic,strong)UITextField *txtField;

@property (nonatomic,strong)WindyKeyBoard *keyBoard;


@end

@implementation TextFieldInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initView];
    
    [self keyBoradAction];
    
}
-(void)keyBoradAction{
    _keyBoard = [[WindyKeyBoard alloc]init];
    _keyBoard.isSuitable = YES;
    _keyBoard.delegate = self;
}
-(void)initView{
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _txtField = [[UITextField alloc]initWithFrame:CGRectMake(100, 500, 100, 30)];
    
    _txtField.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:_txtField];
    
}
#pragma mark - KeyBoard
-(void)WindyKeyBoard:(BOOL)isUp withNotification:(NSNotification *)notifi{
    
}
-(void)WindyKeyBoardBtnClick:(UIButton *)btn{
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [_txtField resignFirstResponder];
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
