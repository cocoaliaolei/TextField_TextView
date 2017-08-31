//
//  ViewController.m
//  WindKeyboard
//
//  Created by winds on 2017/8/22.
//  Copyright © 2017年 东边的风. All rights reserved.
//

#import "ViewController.h"

#import "TextFieldInViewController.h"

#import "SubViewController.h"

#import "TableController.h"

#import "SubView.h"

@interface ViewController ()
{
    SubView *temView;
}

@end

@implementation ViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self initView];
    
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
}

-(void)initView{
    
    UIButton *btn1 = [self creatBtnFrame:CGRectMake(10, 100, WD - 20, 40) withTitle:@"Controller.view上的textfield" tag:10];
    
    UIButton *btn2 = [self creatBtnFrame:CGRectMake(10, CGRectGetMaxY(btn1.frame) + 10, WD - 20, 40) withTitle:@"Controller.view上的subview上的textfield" tag:11];
    
    UIButton *btn3 = [self creatBtnFrame:CGRectMake(10, CGRectGetMaxY(btn2.frame) + 10, WD - 20, 40) withTitle:@"tableViewCell上的textfield" tag:12];
    
    [self.view addSubview:btn1];
    [self.view addSubview:btn2];
    [self.view addSubview:btn3];
    
    
    
    UIButton *btn4 = [self creatBtnFrame:CGRectMake(10, CGRectGetMaxY(btn3.frame) + 30, WD - 20, 40) withTitle:@"View中" tag:13];
    
    [self.view addSubview:btn4];
}


-(UIButton *)creatBtnFrame:(CGRect)frame withTitle:(NSString *)title tag:(NSInteger)tag{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn.frame = frame;
    
    btn.tag = tag;
    
    [btn setTitle:title forState:UIControlStateNormal];
    
    btn.backgroundColor = [UIColor lightGrayColor];
    
    btn.layer.cornerRadius = 5;
    
    btn.layer.masksToBounds = YES;
    
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
    
}

-(void)btnClick:(UIButton *)btn{
    switch (btn.tag) {
        case 10:
            [self controllerView];
            break;
        case 11:
            [self subContrllerView];
            break;
        case 12:
            [self tableContrllerView];
            break;
        case 13:
            [self subViewContrllerView];
            break;
            
        default:
            break;
    }
}
-(void)controllerView{
    TextFieldInViewController *ctl = [[TextFieldInViewController alloc]init];
    [self.navigationController pushViewController:ctl animated:YES];
}
-(void)subContrllerView{
    SubViewController *ctl = [[SubViewController alloc]init];
    [self.navigationController pushViewController:ctl animated:YES];

}
-(void)tableContrllerView{
    TableController *ctl = [[TableController alloc]init];
    [self.navigationController pushViewController:ctl animated:YES];
    
}
-(void)subViewContrllerView{
    
    SubView *sbView = [[SubView alloc]initWithFrame:CGRectMake(10, 350, WD - 20, 300)];
    temView = sbView;
    sbView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:sbView];
}

//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [temView removeFromSuperview];
//    temView = nil;
//}



@end
