//
//  WindyKeyBoard.m
//  WindKeyboard
//
//  Created by winds on 2017/8/22.
//  Copyright © 2017年 东边的风. All rights reserved.
//

#import "WindyKeyBoard.h"

@interface WindyKeyBoard ()
{
    __block CGFloat originalY;
}
@property (nonatomic,strong)UIButton *btn;
@end

@implementation WindyKeyBoard

/**
 *  btnWide   隐藏键盘按钮宽度
 *  btnHeight 隐藏键盘按钮宽度
 */

static  CGFloat btnWide   = 40;
static  CGFloat btnHeight = 30;

-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    [_btn removeFromSuperview];
    _btn = nil;
    
    NSLog(@"--------%s",__FUNCTION__);
    
}
-(UIButton *)btn{
    if (!_btn) {
        _btn = [UIButton buttonWithType:UIButtonTypeCustom];
        _btn.frame = CGRectMake(WD - btnWide, HG, btnWide, btnHeight);
        [_btn addTarget:self action:@selector(downKeyBoard:) forControlEvents:UIControlEventTouchUpInside];
        [_btn setImage:[UIImage imageNamed:@"dropdownmnue"] forState:UIControlStateNormal];
        _btn.layer.cornerRadius  = 3;
        _btn.layer.masksToBounds = YES;
        _btn.backgroundColor = [UIColor redColor];
    }
    return _btn;
}
- (instancetype)init
{
    self = [super init];
    
    if (self) {
        
        [self initSetUp];
        
        [self addNotificationKeyBoard];
        
        [self creatBtn];
        
    }
    return self;
}
-(void)setDelegate:(id<WindyKeyBoardDelegate>)delegate{
    _delegate = delegate;
    /*
     获取view的原始位置
     */
    [self viewAction:^(UIView *view) {
        originalY = view.y;
    }];
}
/*
 添加键盘监听
 */
-(void)addNotificationKeyBoard{
    
    
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(keyBoardShow:)
                                                name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self
                                            selector:@selector(keyBoardHidden:)
                                                name:UIKeyboardWillHideNotification object:nil];

}

/**
 *创建取消键盘的按钮
*/
-(void)creatBtn{
    [[UIApplication sharedApplication].keyWindow addSubview:self.btn];
}
-(void)initSetUp{
    self.isSuitable    = YES;
    self.isShowDownBtn = YES;
}
-(void)setIsShowDownBtn:(BOOL)isShowDownBtn{
    
    _isShowDownBtn = isShowDownBtn;
    self.btn.hidden = !isShowDownBtn;
}

-(void)downKeyBoard:(UIButton *)button{
    
    [self viewAction:^(UIView *view) {
        [view endEditing:YES];
    }];
    
    if (_delegate && [_delegate respondsToSelector:@selector(WindyKeyBoardBtnClick:)]) {
        [_delegate WindyKeyBoardBtnClick:button];
    }
}

/**
 *  键盘升起
 */
-(void)keyBoardShow:(NSNotification *)notifi{
    
    float height = [[notifi.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
    
    _btn.x = WD - _btn.wide;
    
    [UIView animateWithDuration:0.23 animations:^{_btn.y = HG - height - _btn.height;}];
    
    [self setTextFieldLocation:height upOrDown:YES];

    if (_delegate && [_delegate respondsToSelector:@selector(WindyKeyBoard:withNotification:)]) {
        [_delegate WindyKeyBoard:YES withNotification:notifi];
    }
}

-(void)setTextFieldLocation:(CGFloat)kHeight upOrDown:(BOOL)isUp{
    
    if (_isSuitable) {
        [self viewAction:^(UIView *view) {
            UITextField *textField = [self findFirstResponder:view];
            
            if (isUp) {//键盘升起 - view向上偏移
                CGRect rect = [textField convertRect:textField.bounds toView:[UIApplication sharedApplication].keyWindow];
                CGFloat locationY = CGRectGetMaxY(rect);
                if ( locationY > HG - kHeight) {
                    [UIView animateWithDuration:0.23 animations:^{
                        view.y = view.y - (rect.origin.y + rect.size.height + kHeight - HG);
                    }];
                }
            }
            else{//键盘隐藏-还原到初始位置
                
                [UIView animateWithDuration:0.23 animations:^{
                    view.y = originalY;
                }];
            }
        }];
    }
    
}

-(void)keyBoardHidden:(NSNotification *)notifi{
    
    float height = [[notifi.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size.height;
    
    [UIView animateWithDuration:0.23 animations:^{
        _btn.y = HG;
    }];
    
    [self setTextFieldLocation:height upOrDown:NO];
    
    if (_delegate && [_delegate respondsToSelector:@selector(WindyKeyBoard:withNotification:)]) {
        [_delegate WindyKeyBoard:NO withNotification:notifi];
    }
    
    
}
/**
 * 返回view
 * 使用block 操作不同情况
 */
-(void)viewAction:(void(^)(UIView *))block{
    
    if ([_delegate isKindOfClass:[UIViewController class]]) {
        
        UIViewController *ctl = (UIViewController *)_delegate;
        
        if (block) block(ctl.view);
        
    }
    else if([_delegate isKindOfClass:[UIView class]]){
        
        UIView *view = (UIView *)_delegate;
        
        if (block) block(view);
        
    }
}


/*
 找出当前响应的TextField
 */
-(UITextField *)findFirstResponder:(UIView*)view
{
    if (view.isFirstResponder) {
        return (UITextField *)view;
    }
    for (UIView *subView in view.subviews) {
        UIView *firstResponder = [self findFirstResponder:subView];
        if (firstResponder != nil) {
            return (UITextField *)firstResponder;
        }
    }
    return nil;
}
@end
