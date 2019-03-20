//
//  TestRACView.m
//  DemoPractice
//
//  Created by Leon on 2019/3/18.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "TestRACView.h"

@implementation TestRACView

//-(instancetype)initWithFrame:(CGRect)frame{
//    if (self == [super initWithFrame:frame]) {
//        [self setupUI];
//    }
//    return self;
//}
//
//-(void)setupUI{
//
//}

-(instancetype)initWithBgColor:(UIColor *)color Frame : (CGRect )rect{
    
    if (self == [super init]) {
        self.frame = rect;
        self.backgroundColor = color;
    }
    return self;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.subject  sendNext:@"发送值1"];
    [self.subject  sendNext:@"发送值2"];
//    [self sendValue:@"1234" andDic:@{@"key":@"value"}];
    [self sendValue:@"123" andDic:@{@"key":@"value",@"key1":@"value1"}];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"noti" object:nil userInfo:@{@"key":@"value",@"key1":@"value1"}];
}

-(RACSubject *)subject{
    if (_subject == nil) {
        _subject = [RACSubject subject];
    }
    return _subject;
}

@end
