//
//  XZ_SaveTool.m
//  DemoPractice
//
//  Created by Leon on 2019/3/12.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "XZ_SaveTool.h"

@implementation XZ_SaveTool

+(void)setObject:(id)object forKey:(NSString *)key{
    [[NSUserDefaults standardUserDefaults]setObject:object forKey:key];
}

+(id)objectForKey:(NSString *)key{
    return  [[NSUserDefaults standardUserDefaults]objectForKey:key];
}

@end
