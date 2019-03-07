//
//  UINavigationBar+transBar.h
//  DemoPractice
//
//  Created by Leon on 2019/3/7.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationBar (transBar)
- (void)xz_setBackgroundColor:(UIColor *)backgroundColor;
//- (void)lt_setElementsAlpha:(CGFloat)alpha;
//- (void)lt_setTranslationY:(CGFloat)translationY;
- (void)xz_reset;
@end

NS_ASSUME_NONNULL_END
