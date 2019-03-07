//
//  KutilManager.m
//  DemoPractice
//
//  Created by Leon on 2019/3/7.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "KutilManager.h"

static KutilManager *manager = nil;

@implementation KutilManager

+(instancetype)shareManager{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[KutilManager alloc]init];
    });
    
    return manager;
}


//颜色转图片
+(UIImage*) createImageWithColor:(UIColor*) color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}


@end
