//
//  UIImageView+XZCornerRadius.h
//  DemoPractice
//
//  Created by Leon on 2019/3/4.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *解决圆角离屏渲染问题，提高性能
 */

@interface UIImageView (XZ_CornerRadius)

@property (nonatomic, assign) CGFloat aliCornerRadius;

@end


