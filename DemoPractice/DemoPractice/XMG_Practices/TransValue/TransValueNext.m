//
//  TransValueNext.m
//  DemoPractice
//
//  Created by Leon on 2019/3/7.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "TransValueNext.h"

@interface TransValueNext ()

@property(strong,nonatomic) UITextField *customTextField;

@end

@implementation TransValueNext

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"传值第二页";
    [self setupUI];
}

-(void)setupUI{
    
    self.view.backgroundColor = [UIColor whiteColor];
    _customTextField = [[UITextField alloc]init];
    _customTextField.borderStyle = UITextBorderStyleRoundedRect;
    _customTextField.placeholder  = @"请输入要传的值";
    [self.view addSubview:_customTextField];
    [_customTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(100);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(40);
    }];
    
    UIButton *blockBackBtn = [[UIButton alloc]init];
    [blockBackBtn setTitle:@"Block返回" forState:UIControlStateNormal];
    [blockBackBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    blockBackBtn.layer.borderWidth = 1;
    blockBackBtn.layer.borderColor = [UIColor redColor].CGColor;
    [blockBackBtn addTarget:self action:@selector(blockBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:blockBackBtn];
    __weak typeof(self) weakSelf = self;
    [blockBackBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(weakSelf.customTextField.mas_bottom).offset(30);
        make.centerX.mas_equalTo(weakSelf.customTextField.mas_centerX);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(50);
    }];
    
    UIButton *protocolBackBtn = [[UIButton alloc]init];
    [protocolBackBtn setTitle:@"Protocl返回" forState:UIControlStateNormal];
    [protocolBackBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    protocolBackBtn.layer.borderWidth = 1;
    protocolBackBtn.layer.borderColor = [UIColor redColor].CGColor;
    [protocolBackBtn addTarget:self action:@selector(protocolBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:protocolBackBtn];
    [protocolBackBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(blockBackBtn.mas_bottom).offset(30);
        make.centerX.mas_equalTo(blockBackBtn.mas_centerX);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(50);
    }];
    
    UIButton *notiBackBtn = [[UIButton alloc]init];
    [notiBackBtn setTitle:@"notification返回" forState:UIControlStateNormal];
    [notiBackBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    notiBackBtn.layer.borderWidth = 1;
    notiBackBtn.layer.borderColor = [UIColor redColor].CGColor;
    [notiBackBtn addTarget:self action:@selector(notiBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:notiBackBtn];
    [notiBackBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(protocolBackBtn.mas_bottom).offset(30);
        make.centerX.mas_equalTo(protocolBackBtn.mas_centerX);
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(50);
    }];
    
    
    
}

//Block返回
-(void)blockBack{
    self.backBlock(_customTextField.text);
    [self.navigationController popViewControllerAnimated:true];
}

//代理返回
-(void)protocolBack{
    [self.delegate setBackValue:_customTextField.text];
    [self.navigationController popViewControllerAnimated:true];
}

//通知返回
-(void)notiBack{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"backValue" object:nil userInfo:@{@"value":_customTextField.text}];
    [self.navigationController popViewControllerAnimated:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
