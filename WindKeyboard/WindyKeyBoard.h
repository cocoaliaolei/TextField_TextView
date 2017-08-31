//
//  WindyKeyBoard.h
//  WindKeyboard
//
//  Created by winds on 2017/8/22.
//  Copyright © 2017年 东边的风. All rights reserved.


#import <Foundation/Foundation.h>

@class WindyKeyBoard;

@protocol WindyKeyBoardDelegate <NSObject>

@optional

-(void)WindyKeyBoard:(BOOL)isUp withNotification:(NSNotification *)notifi;

-(void)WindyKeyBoardBtnClick:(UIButton *)btn;

@end


@interface WindyKeyBoard : NSObject
/**
 * 是否开启自动避免键盘遮挡
 * 默认YES
 */
@property(nonatomic,assign)BOOL isSuitable;
/**
 * 是否显示键盘上隐藏按钮
 * 默认YES
 */
@property(nonatomic,assign)BOOL isShowDownBtn;


/**
 * delegate:只能为UIViewColtroller或UIView
 */
@property (nonatomic,weak)id<WindyKeyBoardDelegate>delegate;

@end
