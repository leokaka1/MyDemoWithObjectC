//
//  LoginViewModel.m
//  DemoPractice
//
//  Created by Leon on 2019/3/19.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "LoginViewModel.h"

@implementation LoginViewModel

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

-(void)setup{
    
    self.btnEnableSignal = [RACSignal combineLatest:@[RACObserve(self, phoneStr),RACObserve(self, psdStr)] reduce:^(NSString * phone,NSString *psd){
        BOOL isVaildPhone = [[XZ_VerifyTools sharedManager] isMobileNumber:phone];
        BOOL isVaildPsd = [[XZ_VerifyTools sharedManager] isOnlySixWordNumber:psd];
        return @(isVaildPhone && isVaildPsd);
    }];
    
    self.loginCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        NSLog(@"input ==>%@",input);
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            
            [subscriber sendNext:@"success"];
            [subscriber sendCompleted];
            
            return [RACDisposable disposableWithBlock:^{
            }];
        }];
    }];
   
}

-(void)test{
    self.btnEnableSignal = [RACSignal combineLatest:@[RACObserve(self, phoneStr),RACObserve(self, psdStr)] reduce:^(NSString *phone,NSString *psd){
        BOOL isVaildPhone = [[XZ_VerifyTools sharedManager] isMobileNumber:phone];
        BOOL isVaildPsd = [[XZ_VerifyTools sharedManager] isOnlySixWordNumber:psd];
        return  @(isVaildPhone && isVaildPsd);
    }];
    
    self.loginCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        NSLog(@"input ==>%@",input);
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            NSLog(@"开始请求");
            
            NSLog(@"请求成功");
            
            NSLog(@"处理数据");
            
            [subscriber sendNext:@"请求成功"];
            [subscriber sendCompleted];
            return [RACDisposable disposableWithBlock:^{
                NSLog(@"结束");
            }];
        }];
    }];
    
    [[self.loginCommand.executing skip:1] subscribeNext:^(NSNumber * _Nullable x) {
        if ([x boolValue]) {
            NSLog(@"正在执行中……");
        }else{
            NSLog(@"执行结束了");
        }
    }];
}
@end
