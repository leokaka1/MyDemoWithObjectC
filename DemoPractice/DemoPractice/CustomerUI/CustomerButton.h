//
//  CustomerButton.h
//  DemoPractice
//
//  Created by Leon on 2019/3/7.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomerButton : UIButton

-(instancetype)initTitleTextButtonWithTitle:(NSString *)title TitleColor:(UIColor *)color Target:(id)target SEL:(SEL)selector;

@end

NS_ASSUME_NONNULL_END