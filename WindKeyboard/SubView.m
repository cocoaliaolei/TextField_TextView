//
//  SubView.m
//  WindKeyboard
//
//  Created by 廖磊 on 2017/8/24.
//  Copyright © 2017年 东边的风. All rights reserved.
//

#import "SubView.h"
#import "WindyKeyBoard.h"

@interface SubView ()<WindyKeyBoardDelegate>

@property (nonatomic,strong)WindyKeyBoard *keyBoard;

@end

@implementation SubView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self initView];
        
        [self keyBoradAction];
        
    }
    return self;
}
-(void)initView{
    
    UITextField *textFeld = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 200, 30)];
    
    textFeld.backgroundColor = [UIColor orangeColor];
    
    textFeld.centerY = self.height / 2;
    
    textFeld.centerX = self.wide / 2;
    
    [self addSubview:textFeld];
    
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
