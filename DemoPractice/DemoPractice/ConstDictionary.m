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
    if (_mainDict == nil) {
        
        _mainDict = @{@"title":
                          @[@"小码哥大神班视频",@"Label",@"TableView"],
                      
                      @"detail":
                          @[@"大神班一些基础知识介绍",@"Label的基本使用和特殊使用",@"TableView的基本使用和特殊使用"]
                      };
    }
   
    return _mainDict;
}


-(NSDictionary *)getXMGMainDictionary{
    if (_xmgMainDict == nil) {
        _xmgMainDict = @{@"title":
                          @[@"基础类的练习",@"UI类",@"传值练习",@"沙盒存储",@"导航栏渐变",@"TransFrom",@"触摸事件",@"购物车"],
                      
                      @"detail":
                          @[@"OC基础练习,KVC,KVO,字典转模型等",@"UI基础类的练习和补充",@"几种传值方法",@"SandBox存储路径取值问题",@"下拉列表导航栏渐变",@"平移移动，缩放等",@"事件触发",@"购物车的相关逻辑"]
                      };
    }
    
    return _xmgMainDict;
}

@end



