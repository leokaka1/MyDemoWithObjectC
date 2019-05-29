//
//  RunTimeController.m
//  DemoPractice
//
//  Created by Leon on 2019/3/15.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "RunTimeController.h"
#import "RuntimePerson.h"
#import "RuntimePerson+Play.h"
#import <objc/message.h>

@interface RunTimeController ()

@end

@implementation RunTimeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor whiteColor];
//    RuntimePerson *p = [[RuntimePerson alloc]init];
//    objc_msgSend(p, @selector(run));
    
//    无需导入头文件就可以关联类
//    id p = objc_msgSend(objc_msgSend(objc_getClass("RuntimePerson"), sel_registerName("alloc")),sel_registerName("init"));
//    objc_msgSend(p,sel_registerName("run"));
//   int i = (int)objc_msgSend(p,sel_registerName("eat"));
//    NSLog(@"%d",i);

//    动态添加分类属性
    RuntimePerson *p = [[RuntimePerson alloc]init];
    p.gameName = @"王者荣耀";
    [p play];
    [p fuck];
    NSLog(@"gameName == >%@",p.gameName);
    
}



@end
