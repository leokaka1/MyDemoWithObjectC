//
//  XZ_AnimationAlertView.h
//  Project_Demo
//
//  Created by caoxiaozhu on 2018/7/10.
//  Copyright © 2018年 caoxiaozhu. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 显示时动画弹框样式
 */
typedef NS_ENUM(NSInteger,XZ_AnimationPopStyle){
    XZ_AnimationPopStyleNO = 0,             ///< 无动画
    XZ_AnimationPopStyleScale,                ///< 缩放动画，先放大，后恢复至原大小
    XZ_AnimationPopStyleShakeFromTop,         ///< 从顶部掉下到中间晃动动画
    XZ_AnimationPopStyleShakeFromBottom,      ///< 从底部往上到中间晃动动画
    XZ_AnimationPopStyleShakeFromLeft,        ///< 从左侧往右到中间晃动动画
    XZ_AnimationPopStyleShakeFromRight,       ///< 从右侧往左到中间晃动动画
    XZ_AnimationPopStyleCardDropFromLeft,     ///< 卡片从顶部左侧开始掉落动画
    XZ_AnimationPopStyleCardDropFromRight,    ///< 卡片从顶部右侧开始掉落动画
};

/**
 移除时动画弹框样式
 */
typedef NS_ENUM(NSInteger, XZ_AnimationDismissStyle) {
    XZ_AnimationDismissStyleNO = 0,               ///< 无动画
    XZ_AnimationDismissStyleScale,                ///< 缩放动画
    XZ_AnimationDismissStyleDropToTop,            ///< 从中间直接掉落到顶部
    XZ_AnimationDismissStyleDropToBottom,         ///< 从中间直接掉落到底部
    XZ_AnimationDismissStyleDropToLeft,           ///< 从中间直接掉落到左侧
    XZ_AnimationDismissStyleDropToRight,          ///< 从中间直接掉落到右侧
    XZ_AnimationDismissStyleCardDropToLeft,       ///< 卡片从中间往左侧掉落
    XZ_AnimationDismissStyleCardDropToRight,      ///< 卡片从中间往右侧掉落
    XZ_AnimationDismissStyleCardDropToTop,        ///< 卡片从中间往顶部移动消失
};


@interface XZ_AnimationAlertView : UIView


/**
 初始化弹窗

 @param view 用户传入的View
 @param popStyle 弹入模式
 @param dismissStyle 消失模式
 @param popDur 弹入时间
 @param dismissDur 消失时间
 @param clickToHide 点击背景消失
 @param popBGAlpha 背景透明度
 */
-(instancetype)initWithCustomerView:(UIView *)view PopStyle:(XZ_AnimationPopStyle)popStyle DismissStyle:(XZ_AnimationDismissStyle)dismissStyle PopDuration:(NSInteger)popDur DismissDuration:(NSInteger)dismissDur ClickBacToHide:(BOOL)clickToHide BackAlpha:(CGFloat)popBGAlpha;


/**
 隐藏弹窗方法

 @param dur 时长
 */
-(void)hideWithDur:(CGFloat)dur;

/**
 移除弹框
 */
- (void)dismiss;

@end
