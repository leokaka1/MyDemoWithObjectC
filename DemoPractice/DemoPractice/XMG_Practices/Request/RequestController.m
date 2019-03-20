//
//  RequestController.m
//  DemoPractice
//
//  Created by Leon on 2019/3/15.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "RequestController.h"
#import "DishModel.h"
#import "StepModel.h"

@interface RequestController ()
@property(strong,nonatomic) DishModel *dishModel;
@property(strong,nonatomic) NSMutableArray *dataArr;
@end

@implementation RequestController

-(NSMutableArray *)dataArr{
    if (_dataArr ==nil) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self jsonSerilization];
}

-(void)NSURLConnection_GET{
//    URLConnection 基本不用
//    请求地址
    NSURL *url = [NSURL URLWithString:@""];
    
//    创建请求对象
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
//    使用nsurlconnection 发送同步请求
    NSURLResponse *response = nil;
    NSError *error= nil;
//    发送同步请求，也可以发送异步请求
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
//    异步发送请求
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        
    }];
    
//    打印查看服务头
    NSLog(@"%@",response);
    
//    解析服务器返回（data > 字符串）
    NSString *strnig =  [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
}

-(void)NSURLConnection_POST{
    //    URLConnection 基本不用
    //    请求地址
    NSURL *url = [NSURL URLWithString:@""];
    
    //    创建请求对象
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
//    请求方式i
    request.HTTPMethod = @"POST";
    
//    设置参数
    request.HTTPBody = [@"username=520&pwd=520" dataUsingEncoding:NSUTF8StringEncoding];
    
    //    异步发送请求
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        //    解析服务器返回（data > 字符串）
        NSString *string =  [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@",string);
    }];
}

-(void)NSURLSession_GET{
    //    URLConnection 基本不用
    //    请求地址
    NSURL *url = [NSURL URLWithString:@""];
    
    //    创建请求对象
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
//    创建session
    NSURLSession *session = [NSURLSession sharedSession];
    
//    创建task
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //    解析服务器返回（data > 字符串）
        NSString *string =  [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"%@",string);
    }];
    
//    启动
    [task resume];
}

-(void)NSURLSession_POST{
    //    URLConnection 基本不用
    //    请求地址
    NSURL *url = [NSURL URLWithString:@""];
    
    //    创建请求对象
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    request.HTTPMethod = @"POST";
    
    //    设置参数
    request.HTTPBody = [@"username=520&pwd=520" dataUsingEncoding:NSUTF8StringEncoding];
    
    //    创建session
    NSURLSession *session = [NSURLSession sharedSession];
    
    //    创建task
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //    解析服务器返回（data > 字符串）
        NSString *string =  [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
        
//        反序列化处理(json -> oc )
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        NSLog(@"%@",string);
    }];
    
    //    启动
    [task resume];
}

-(void)jsonSerilization{
//    http://apis.juhe.cn/cook/query.php
//    AppKey：e45519a1dc9dc6d5c11bf0692806ecc7
    /*
     menu    是    string    需要查询的菜谱名
     key    是    string    在个人中心->我的数据,接口名称上方查看
     */
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    /**
     *  可以接受的类型
     */
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/json",@"text/javascript",@"text/plain", nil];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager.requestSerializer setValue:@"application/x-www-form-urlencoded;charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    manager.requestSerializer.timeoutInterval = 30;
    
    NSDictionary *param = @{@"menu":@"鱼香肉丝",@"key":@"e45519a1dc9dc6d5c11bf0692806ecc7"};
    [manager GET:@"http://apis.juhe.cn/cook/query.php" parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        NSDictionary *result = responseObject[@"result"];
        NSArray *dataArr = result[@"data"];
//        NSLog(@"dataArr==>%@",dataArr);
        [self transJsonToObject:dataArr];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error===>%@",error);
    }];
}

-(void)transJsonToObject:(NSArray *)array{
//    字典转模型
    for (int i = 0; i<array.count; i++) {
        
        [DishModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
            return @{@"ID":@"id"};
        }];
        
        self.dishModel = [DishModel mj_objectWithKeyValues:array[i]];
        [self.dataArr addObject:self.dishModel];
    }
    
    DishModel *dishModel1 = self.dataArr[1];
    StepModel *stepModel = dishModel1.steps[1];
    NSLog(@"model1 ==>%@",stepModel.step);
}

@end
