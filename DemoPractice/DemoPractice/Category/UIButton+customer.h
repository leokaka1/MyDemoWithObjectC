//
//  UIButton+customer.h
//  DemoPractice
//
//  Created by Leon on 2019/3/18.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (customer)

+(UIButton *)ButtonWithFrame : (CGRect)rect Title:(NSString *)title TitleColor:(UIColor *)color Target:(id)target SEL:(SEL)selector;


/**
 设置自定义是否圆角按钮

 @param rect 尺寸大小
 @param title 标题
 @param fontSize 字体大小
 @param color 字体颜色
 @param bacColor 背景颜色
 @param imageName 背景图片
 @param isRound 是否圆角
 @return 返回按钮
 */
+(UIButton *)ButtonWithFrame: (CGRect)rect Title:(NSString *)title TitleFontSize:(CGFloat)fontSize TitleColor:(UIColor *)color BacgroundColor:(UIColor *)bacColor IsRoundCorner : (BOOL) isRound;

@end

NS_ASSUME_NONNULL_END
