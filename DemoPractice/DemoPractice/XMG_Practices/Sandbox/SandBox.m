//
//  SandBox.m
//  DemoPractice
//
//  Created by Leon on 2019/3/7.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "SandBox.h"

@interface SandBox ()

@property(strong,nonatomic)  NSString *path;

@end

@implementation SandBox

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"沙盒存储";
    self.view.backgroundColor = [UIColor whiteColor];
    
    CustomerButton *saveButton = [[CustomerButton alloc]initTitleTextButtonWithTitle:@"save" TitleColor:[UIColor blueColor] Target:self SEL:@selector(save)];
    [self.view addSubview:saveButton];
    [saveButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(100);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.width.height.mas_equalTo(50);
    }];
    
    CustomerButton *loadButton = [[CustomerButton alloc]initTitleTextButtonWithTitle:@"load" TitleColor:[UIColor blueColor] Target:self SEL:@selector(load)];
    [self.view addSubview:loadButton];
    [loadButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(saveButton).offset(100);
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.width.height.mas_equalTo(50);
    }];
    
    
    [self test1];
}


-(void)save{
//    存储沙盒路径
    NSArray *tempArr = @[@"leon",@19];
//    沙盒路径目录
//    NSLog(@"%@",NSHomeDirectory());
   _path =  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true) firstObject];
    //    拼接文件名称
//    NSString *fileName  = [NSString stringWithFormat:@"%@/file.plist",path];
    NSString *filePath = [_path stringByAppendingPathComponent:@"file.plist"];
    BOOL isSuccess =  [tempArr writeToFile:filePath atomically:true];
    if (isSuccess) {
        NSLog(@"写入成功");
    }else{
        NSLog(@"写入失败");
    }
    NSLog(@"path = %@",_path);


//    偏好设置
    [[NSUserDefaults standardUserDefaults] setObject:@"123" forKey:@"name"];
    
}

-(void)load{
    
    _path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true) firstObject];
    NSString *fileName = [_path stringByAppendingPathComponent:@"file.plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:fileName];
    NSLog(@"元素一 ==>%@",array[1]);
    
     NSString *detail =   [[NSUserDefaults standardUserDefaults] objectForKey:@"name"];
    NSLog(@"default == >%@",detail);
}


-(void)test1{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"shop.plist" ofType:nil];
    NSArray *imageArr = [NSArray arrayWithContentsOfFile:path];
    for (NSDictionary *dict in imageArr) {
        NSString *image = dict[@"img"];
        NSURL *url = [NSURL URLWithString:image];
        NSData *data = [NSData dataWithContentsOfURL:url];
        NSString *fileName = [image lastPathComponent];
//        获取cache路径
        NSString *fullPath = [kCachesDirectory stringByAppendingPathComponent:fileName];
        NSLog(@"path==>%@",fullPath);
        [data writeToFile:fullPath atomically:true];
    }
}

@end
