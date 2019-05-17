//
//  TransValue.m
//  DemoPractice
//
//  Created by Leon on 2019/3/7.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "TransValue.h"
#import "TransValueNext.h"

@interface TransValue ()<backDelegate>
@property(strong,nonatomic) UILabel *showLabel;

@end

@implementation TransValue

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"传值";
    [self setupUI];
}

-(void)setupUI{
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"下一页" style:UIBarButtonItemStyleDone target:self action:@selector(clickToNext)];
    
    _showLabel = [[UILabel alloc]init];
    _showLabel.text = @"123";
    _showLabel.textColor = [UIColor whiteColor];
    [_showLabel sizeToFit];
    _showLabel.backgroundColor = [UIColor redColor];
    [self.view addSubview:_showLabel];
    [_showLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
}

-(void)clickToNext{
    __weak typeof(self) weakSelf  = self;
    TransValueNext *next = [[TransValueNext alloc]init];

//    block
    next.backBlock = ^(NSString * _Nonnull str) {
        weakSelf.showLabel.text = str;
    };

//    delegate
    next.delegate = self;

//    noti
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receivesNoti:) name:@"backValue" object:nil];
//
    [self.navigationController pushViewController:next animated:true];

//    用反射机制创建VC
//    Class class  = NSClassFromString(@"TransValueNext");
//    UIViewController *vc = [[class alloc]init];
//    [self.navigationController pushViewController:vc animated:true];

}

-(void)setBackValue:(NSString *)str{
    _showLabel.text = str;
}

-(void)receivesNoti:(NSNotification *)noti{
    NSDictionary *dict = noti.userInfo;
    _showLabel.text = dict[@"value"];
    
}




@end
