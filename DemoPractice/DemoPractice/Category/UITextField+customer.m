//
//  UITextField+customer.m
//  DemoPractice
//
//  Created by Leon on 2019/3/18.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "UITextField+customer.h"

@implementation UITextField (customer)

+(UITextField *)textFieldWithPlaceholder:(NSString *)placehoder PlaceHolderColor:(UIColor *)pcolor RectType : (UITextBorderStyle )type{
    UITextField *field  = [[UITextField alloc]init];
    field.borderStyle = type;
    field.placeholder = placehoder;
    return field;
}

@end
