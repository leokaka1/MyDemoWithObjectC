//
//  UITextField+customer.h
//  DemoPractice
//
//  Created by Leon on 2019/3/18.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (customer)

+(UITextField *)textFieldWithPlaceholder:(NSString *)placehoder PlaceHolderColor:(UIColor *)pcolor RectType : (UITextBorderStyle )type;

@end

NS_ASSUME_NONNULL_END
