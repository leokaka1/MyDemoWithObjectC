//
//  XZ_RootTool.m
//  DemoPractice
//
//  Created by Leon on 2019/3/12.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "XZ_RootTool.h"
#import "MainPage.h"


#define kVersion @"curVersion"
@implementation XZ_RootTool

+(UIViewController *)chooseRootVC{
    UIViewController *destVc = [[UIViewController alloc]init];
//    获取当前的版本
    NSString *curVersion = kCurrentVersion;
//    NSLog(@"%@",kCurrentVersion);
    
//    取出之前存储的版本
    NSString *preVersion = [XZ_SaveTool objectForKey:kVersion];
    
//    如果版本一致则不显示guidView
    if ([curVersion isEqualToString:preVersion]) {
        
        
    }else{
//        如果版本不一致则显示引导页
        
        
        
//        保存版本号
        [XZ_SaveTool setObject:curVersion forKey:kVersion];
    }
    
    return destVc;
}

@end
