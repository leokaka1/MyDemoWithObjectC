//
//  RACController.m
//  DemoPractice
//
//  Created by Leon on 2019/3/18.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "RACController.h"
#import "TestRAC.h"
#import "TestRACView.h"

@interface RACController ()

@property(strong,nonatomic) XZ_AnimationAlertView *animationAlert;
@property (nonatomic, strong) RACDisposable *disposable;
@property(strong,nonatomic) UIView *redView;

@end

@implementation RACController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = Color_White;
    
#if 0
    [self demo1];
    [self demo2];
    [self demo3];
    [self demo4];
    [self demo5];
    [self demo6];
    [self demo7];
    [self demo8];
    [self demo9];
    [self demo10];
    [self demo11];
    [self demo12];
    [self demo13];
    [self demo14];
    [self demo15];
    [self demo16];
    [self demo17];
    [self demo18];
    [self demo19];
#endif
    [self demo20];
}

//监听点击事件
-(void)demo1{
//    UIButton *clickBtn = [[UIButton alloc]init];
//    [clickBtn setTitle:@"点击我" forState:UIControlStateNormal];
//    [clickBtn setTitleColor:Color_Red forState:UIControlStateNormal];
//    clickBtn.frame = CGRectMake(10, 10, 100, 30);
//    [self.view addSubview:clickBtn];
    
    UIButton *clickBtn = [UIButton ButtonWithFrame:CGRectMake(10, 100, 100, 30) Title:@"点击我" TitleFontSize:0 TitleColor:Color_Blue BacgroundColor:Color_Red  IsRoundCorner:true];
//    用rac监听按钮点击
    [[clickBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        NSLog(@"123");
    }];
    
    [self.view addSubview:clickBtn];
    
}

//监听输入框
-(void)demo2{
    UITextField *field = [UITextField textFieldWithPlaceholder:@"请输入值" PlaceHolderColor:Color_Gray RectType:UITextBorderStyleRoundedRect];
    field.frame = CGRectMake(30, 150, 150, 30);
    [self.view addSubview:field];
    
//    监听输入框的值
//    [[field rac_textSignal] subscribeNext:^(NSString * _Nullable x) {
////        NSLog(@"输入的值为==%@",x);
//        if (x.length > 10) {
//            NSLog(@"字符串长度大于10了");
//        }
//    }];
    
    [[[field rac_textSignal] map:^id _Nullable(NSString * _Nullable value) {
        if (value.length > 10) {
            return @(true);
        }else{
            return @(false);
        }
    }] subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
    
//    [[[field rac_textSignal] map:^id _Nullable(NSString * _Nullable value) {
//        return @([value length]);
//
//    }] subscribeNext:^(id  _Nullable x) {
//        NSLog(@"x==>%@",x);
//    }];
    
}

//监听按钮和KVO
-(void)demo3{
//    KVO
    
    TestRAC *rac  = [TestRAC new];
    rac.name = @"123";
    
    
    UIButton *clickBtn = [UIButton ButtonWithFrame:CGRectMake(10, 100, 100, 30) Title:@"点击我" TitleFontSize:0 TitleColor:Color_Blue BacgroundColor:Color_Red  IsRoundCorner:true];
    [self.view addSubview:clickBtn];
    //    用rac监听按钮点击
    [[clickBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        rac.name = @"123123123";
    }];
    
//    KVO
    [[rac rac_valuesAndChangesForKeyPath:@"name" options:NSKeyValueObservingOptionNew observer:self] subscribeNext:^(RACTwoTuple<id,NSDictionary *> * _Nullable x) {
        NSLog(@"name的值改变成%@",x.first);
    }];
}

//代理通知
-(void)demo4{
//
    TestRACView *view = [[TestRACView alloc]initWithBgColor:Color_Red Frame:CGRectMake(100, 100, 100, 100)];
//    代理单值
    [view.subject subscribeNext:^(id  _Nullable x) {
        NSLog(@"x==>%@",x);
    }];
    
//    代理多值
    [[view rac_signalForSelector:@selector(sendValue:andDic:)] subscribeNext:^(RACTuple * _Nullable x) {
        NSDictionary *dict = x.second;
        NSLog(@"传值的字典为==>%@",dict[@"key"]);
    }];
    
    
#if 1
    [self.view addSubview:view];
#endif
    
//    通知
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:@"noti" object:nil] subscribeNext:^(NSNotification * _Nullable x) {
        NSLog(@"x-=-->%@",x.userInfo);
    }];
}

//    定时器
-(void)demo5{
//    定时器
    self.disposable = [[RACSignal interval:1.0 onScheduler:[RACScheduler mainThreadScheduler]] subscribeNext:^(NSDate * _Nullable x) {
        NSLog(@"当前时间是==>%@",x);
        
        [self.disposable dispose];
    }];
}

//关联
-(void)demo6{
//    两个信号串联
    RACSignal *signalA = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [subscriber sendNext:@"吃饭"];
        [subscriber sendCompleted];
        return nil;
    }];
    
    RACSignal *signalB = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [subscriber sendNext:@"睡觉"];
        [subscriber sendCompleted];
        return nil;
    }];
    
    RACSignal *combineSignal = [signalA concat:signalB];
    [combineSignal subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@",x);
    }];
}

//并联
- (void)demo7{
    //创建信号A
    RACSignal *siganlA = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@"纸厂污水"];
        [subscriber sendCompleted];
        return nil;
    }];
    
    //创建信号B
    RACSignal *siganlB = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        [subscriber sendNext:@"电镀厂污水"];
        [subscriber sendCompleted];
        return nil;
    }];
    
    //并联两个信号,根上面一样,分两次打印
    RACSignal *mergeSiganl = [RACSignal merge:@[siganlA,siganlB]];
    [mergeSiganl subscribeNext:^(id x) {
        
        NSLog(@"%@",x);
        
    }];
    
}

//组合
- (void)demo8{
    //定义2个自定义信号
    RACSubject *letters = [RACSubject subject];
    RACSubject *numbers = [RACSubject subject];
    
    //组合信号
    [[RACSignal combineLatest:@[letters,numbers] reduce:^(NSString *letter, NSString *number){
        
        return [letter stringByAppendingString:number];
    }] subscribeNext:^(id x) {
        NSLog(@"%@",x);
        
    }];
    
    
    //自己控制发生信号值
    [letters sendNext:@"A"];
    [letters sendNext:@"B"];
    [numbers sendNext:@"1"]; //打印B1
    [letters sendNext:@"C"];//打印C1
    [numbers sendNext:@"2"];//打印C2
    
    
    
}

//压缩
- (void)demo9{
    
    //创建信号A
    RACSignal *siganlA = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        [subscriber sendNext:@"红"];
        [subscriber sendCompleted];
        return nil;
    }];
    
    //创建信号B
    RACSignal *siganlB = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        [subscriber sendNext:@"白"];
        [subscriber sendCompleted];
        return nil;
    }];
    
    //合流后处理的是压缩包,需要解压后才能取到里面的值
    [[siganlA zipWith:siganlB] subscribeNext:^(id x) {
        
        //解压缩
        RACTupleUnpack(NSString *stringA, NSString *stringB) = x;
        NSLog(@"%@ %@",stringA, stringB);
    }];
    
}

//    10.映射
- (void)demo10{
//    10.映射,我可以点石成金
    RACSignal *siganl = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [subscriber sendNext:@"石"];
        [subscriber sendCompleted];
        return nil;
    }];
    //对信号进行改造,改"石"成"金"
    siganl = [siganl map:^id(NSString *value) {
        if ([value isEqualToString:@"石"]) {
            return @"金";
        }
        return value;
        
    }];
    
    //打印,不论信号发送的是什么,这一步都会走的
    [siganl subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
}

//11.过滤
- (void)demo11{
//    ,未满18岁,禁止入内
    RACSignal *singal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        [subscriber sendNext:@(15)];
        [subscriber sendNext:@(17)];
        [subscriber sendNext:@(21)];
        [subscriber sendNext:@(14)];
        [subscriber sendNext:@(30)];
        [subscriber sendCompleted];
        
        return nil;
    }];
    
    //过滤信号,打印
    [[singal filter:^BOOL(NSNumber *value) {
        //大于18岁的,才可以通过
        return value.integerValue >= 18;//return为yes可以通过
    }] subscribeNext:^(id x) {
        NSLog(@"%@",x);
    }];
}

//12秩序
-(void)demo12{
    
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSLog(@"打蛋液");
        [subscriber sendNext:@"蛋液"];
        [subscriber sendCompleted];
        return nil;
        
    }];
    
    //对信号进行秩序秩序的第一步
    signal = [signal flattenMap:^__kindof RACSignal * _Nullable(id  _Nullable value) {
        //处理上一步的RACSiganl的信号value.这里的value=@"蛋液"
        NSLog(@"把%@倒进锅里面煎",value);
        
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            [subscriber sendNext:@"煎蛋"];
            [subscriber sendCompleted];
            return nil;
        }];
    }];
    
    signal = [signal flattenMap:^__kindof RACSignal * _Nullable(id  _Nullable value) {
        //处理上一步的RACSiganl的信号value.这里的value=@"蛋液"
        NSLog(@"把%@装载盘里",value);
        
        return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            [subscriber sendNext:@"上菜"];
            [subscriber sendCompleted];
            return nil;
        }];
    }];
    
    //最后打印 最后带有===上菜
    [signal subscribeNext:^(id x) {
        NSLog(@"====%@",x);
    }];
    
}

//14.延迟
- (void)demo14{
    RACSignal *siganl = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSLog(@"等等我,我还有10s就到了");
        [subscriber sendNext:@"北极"];
        [subscriber sendCompleted];
        return nil;
    }];
    
    //延迟10s接受next的玻璃球
    [[siganl delay:10] subscribeNext:^(id x) {
        
        NSLog(@"我到了%@",x);
        
    }];
}

//15.重放
- (void)demo15{
    
    RACSignal *siganl = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSLog(@"电影");
        [subscriber sendNext:@"电影"];
        [subscriber sendCompleted];
        return nil;
        
    }];
    
    //创建该普通信号的重复信号
    RACSignal *replaySiganl = [siganl replay];
    //重复接受信号
    [replaySiganl subscribeNext:^(NSString *x) {
        NSLog(@"小米%@",x);
    }];
    [replaySiganl subscribeNext:^(NSString *x) {
        NSLog(@"小红%@",x);
        
    }];
}

//16.定时---每隔8小时服用一次药
- (void)demo16{
    //创建定时器信号.定时8小时
    RACSignal *siganl = [RACSignal interval:60 * 60 * 8 onScheduler:[RACScheduler mainThreadScheduler]];
    //定时器执行代码
    [siganl subscribeNext:^(id x) {
        NSLog(@"吃药");
        
    }];
}

//    17.超时
- (void)demo17{

    RACSignal *siganl = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSLog(@"我快到了");
        RACSignal *sendSiganl = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
            
            [subscriber sendNext:nil];
            [subscriber sendCompleted];
            return nil;
        }];
        
        //发生信号要1个小时10分钟才到
        [[sendSiganl delay:60 * 70] subscribeNext:^(id x) {
            //这里才发送next玻璃球到siganl
            [subscriber sendNext:@"我到了"];
            [subscriber sendCompleted];
            
        }];
        return nil;
        
        
    }];
    
    [[siganl timeout:60 * 60 onScheduler:[RACScheduler mainThreadScheduler]] subscribeNext:^(id x) {
        
        NSLog(@"等了你一个小时,你一直没来,我走了");
        
    }];
    
}

//    18.重试
- (void)demo18{

    __block int failedCount = 0;
    
    //创建信号
    RACSignal *siganl = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        if (failedCount < 100) {
            failedCount ++;
            NSLog(@"我失败了");
            [subscriber sendError:nil];
        }else{
            NSLog(@"经历了数百次后,我成功了");
            [subscriber sendNext:nil];
            
        }
        return nil;
        
    }];
    
    //重试
    RACSignal *retrySiganl = [siganl retry];
    //直到发生next的玻璃球
    [retrySiganl subscribeNext:^(id x) {
        NSLog(@"重要成功了");
        
    }];
    
}

//19.节流,不好意思,这里每一秒只能通过一个人,如果1s内发生多个,只通过最后一个
- (void)demo19{
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        //即使发送一个next的玻璃球
        [subscriber sendNext:@"A"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [subscriber sendNext:@"B"];
            
        });
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [subscriber sendNext:@"C"];
            [subscriber sendNext:@"D"];
            [subscriber sendNext:@"E"];
            
        });
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [subscriber sendNext:@"F"];
        });
        return nil;
        
    }];
    
    //对信号进行节流,限制时间内一次只能通过一个玻璃球
    [[signal throttle:1] subscribeNext:^(id x) {
        NSLog(@"%@通过了",x);
        
    }];
    /*
     [2015-08-16 22:08:45.677]旅客A
     [2015-08-16 22:08:46.737]旅客B
     [2015-08-16 22:08:47.822]旅客E
     [2015-08-16 22:08:48.920]旅客F
     */
    
}

//条件(takeUntil方法,当给定的signal完成前一直取值)
- (void)demo20{
    
    RACSignal *takeSiganl = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        //创建一个定时器信号,每一秒触发一次
        RACSignal *siganl = [RACSignal interval:1 onScheduler:[RACScheduler mainThreadScheduler]];
        [siganl subscribeNext:^(id x) {
            //在这里定时发送next玻璃球
            [subscriber sendNext:@"直到世界尽头"];
            
        }];
        return nil;
        
    }];
    
    //创建条件信号
    RACSignal *conditionSiganl = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        //设置5s后发生complete玻璃球
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSLog(@"世界的今天到了,请下车");
            [subscriber sendCompleted];
        });
        return nil;
    }];
    
    //设置条件,takeSiganl信号在conditionSignal信号接收完成前,不断取值
    [[takeSiganl takeUntil:conditionSiganl] subscribeNext:^(id x) {
        NSLog(@"%@",x);
        
    }];
    
    
}

@end
