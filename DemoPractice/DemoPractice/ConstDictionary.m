//
//  ConstDictionary.m
//  DemoPractice
//
//  Created by Leon on 2019/3/4.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "ConstDictionary.h"

@implementation ConstDictionary

-(NSDictionary *)getMainDictionary{
    
    _mainDict = @{@"title":
                                   @[@"Button",@"Label",@"TableView"],
                  
                                   @"detail":
                                   @[@"按钮的基本使用和特殊使用",@"Label的基本使用和特殊使用",@"TableView的基本使用和特殊使用"]
                            };
    
    
    return _mainDict;
}

@end
