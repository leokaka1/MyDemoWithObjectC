//
//  RAC_LoginController.m
//  DemoPractice
//
//  Created by Leon on 2019/3/19.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "RAC_LoginController.h"
#import "LoginViewModel.h"

@interface RAC_LoginController ()

@property (weak, nonatomic) IBOutlet UITextField *phoneField;

@property (weak, nonatomic) IBOutlet UITextField *psdField;

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@property(strong,nonatomic) LoginViewModel *viewModel;


@end

@implementation RAC_LoginController

-(LoginViewModel *)viewModel{
    if (_viewModel == nil) {
        _viewModel = [[LoginViewModel alloc]init];
    }
    return _viewModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title = @"RAC登录页面";
    
    RACSignal *phoneSignal = [_phoneField rac_textSignal];
    RACSignal *psdSignal = [_psdField rac_textSignal];
    
    //组合信号
//    [[RACSignal combineLatest:@[phoneSignal,psdSignal] reduce:^(NSString *phoneStr, NSString *psdStr){
//        if (phoneStr != nil && psdStr !=nil) {
//            BOOL isVaildPhone = [[XZ_VerifyTools sharedManager] isMobileNumber:phoneStr];
//            BOOL isVaildPsd = [[XZ_VerifyTools sharedManager] isValidPayPsd:psdStr];
//            if (isVaildPsd && isVaildPhone) {
//                return @(true);
//            }else{
//                return @(false);
//            }
//        }
//        return @(false);
//    }] subscribeNext:^(id x) {
//        NSLog(@"%@",x);
//
//    }];
    
//    RACSignal *btnEnableSignal = [RACSignal combineLatest:@[phoneSignal,psdSignal] reduce:^(NSString * phoneStr,NSString *psd){
//        BOOL isVaildPhone = [[XZ_VerifyTools sharedManager] isMobileNumber:phoneStr];
//        BOOL isVaildPsd = [[XZ_VerifyTools sharedManager] isOnlySixWordNumber:psd];
//        return  @(isVaildPhone && isVaildPsd);
//    }];
//
//    @weakify(self);
//    [btnEnableSignal subscribeNext:^(id  _Nullable x) {
//        NSLog(@"x==>%@",x);
//        @strongify(self);
//        if ([x integerValue] == 0) {
//            self.loginBtn.enabled = false;
//            self.loginBtn.backgroundColor = [UIColor lightGrayColor];
//        }else{
//            self.loginBtn.enabled = true;
//            self.loginBtn.backgroundColor = [UIColor redColor];
//        }
//    }];
    
    RAC(self.viewModel,phoneStr) = self.phoneField.rac_textSignal;
    RAC(self.viewModel,psdStr) = self.psdField.rac_textSignal;
    RAC(self.loginBtn,enabled) = self.viewModel.btnEnableSignal;
    
    [[self.loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [self.viewModel.loginCommand execute: @{@"phone":self.phoneField.text,@"psd":self.psdField.text}];
    }];
    
    [self.viewModel.loginCommand.executionSignals.switchToLatest subscribeNext:^(NSString* x) {

        NSLog(@"x==>%@",x);
    }];
    
}

-(void)test{
    RAC(self.viewModel,phoneStr) = self.phoneField.rac_textSignal;
    RAC(self.viewModel,psdStr) = self.psdField.rac_textSignal;
    RAC(self.loginBtn,enabled) = self.viewModel.btnEnableSignal;
    
    [self.viewModel.loginCommand.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
        NSLog(@"x==>%@",x);
        NSLog(@"登录成功,跳转页面");
    }];
    
    [[self.loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [self.viewModel.loginCommand execute:@{@"phone":self.phoneField.text,@"psd":self.psdField.text}];
    }];
}

@end
