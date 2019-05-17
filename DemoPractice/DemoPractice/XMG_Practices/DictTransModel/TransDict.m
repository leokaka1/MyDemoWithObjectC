//
//  TransDict.m
//  DemoPractice
//
//  Created by Leon on 2019/3/6.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "TransDict.h"
#import "Person.h"
#import "Cat.h"

@interface TransDict ()

@property(strong,nonatomic) NSArray *dataArr;
@property(strong,nonatomic) NSMutableArray *personArr;
@property(strong,nonatomic) Person *p;
@property(copy,nonatomic) int(^block)(int num);

@end

@implementation TransDict

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.personArr = [NSMutableArray array];
    [self setDataSource];
    
//    [self transDict];
    [self setKVC];
//    [self setKVO];
}

#pragma mark - 设置数据源
//设置数据源
-(void)setDataSource{
    
    self.dataArr = @[@{
                      @"name":@"leon",
                       @"age":@"17",
                       @"dog":@[
                                      @{@"name":@"monkey",@"age":@"3"},
                                      @{@"name":@"haki",@"age":@"2"}
                                      ]
                              },
                     @{@"name":@"sisi",
                           @"age":@"20",
                           @"dog":@[
                               @{@"name":@"kitty",@"age":@"1"},
                               @{@"name":@"jonki",@"age":@"3"}
                            ]
                       },
                     ];
}

#pragma mark - 字典转模型
//字典转模型
-(void)transDict{
    for (NSDictionary *dict in self.dataArr) {
        Person *person = [[Person alloc]initWithDict:dict];
        [self.personArr addObject:person];
    }
    
//    取第一个人的信息
    Person *p1 = self.personArr[0];
    Dog *dog1 = p1.dogArr[0];
    NSLog(@"第一个人的姓名是%@,年龄是%@,第一只狗的名字是%@，第一只狗的年龄是%@",p1.name,p1.age,dog1.name,dog1.age);
    
}


#pragma mark - KVC
-(void)setKVC{
//    Cat *cat = [[Cat alloc]init];
//    [cat setValue:@"ketty" forKeyPath:@"name"];
//    NSLog(@"Cat name = %@",[cat valueForKey:@"name"]);
    
//    keyPath
    _p = [[Person alloc]init];
    [_p setValue:@"Leon1" forKey:@"name"];
    [_p setValue:@"Leon2" forKey:@"name2"];
    [_p setValue:@"Leon3" forKey:@"name3"];
    [_p setValue:@"Leon4" forKey:@"name4"];
    [_p setValue:@"Leon5" forKey:@"name5"];
    [_p setValue:@"Leon6" forKey:@"name6"];
    
    NSString*name1 =  [_p valueForKey:@"name"];
    NSString*name2 = [_p valueForKey:@"name2"];
    NSString*name3 = [_p valueForKey:@"name3"];
    NSString*name4 = [_p valueForKey:@"name4"];
    NSString*name5 = [_p valueForKey:@"name5"];
    NSString*name6 = [_p valueForKey:@"name6"];
    
    NSLog(@"\nname1 = %@\n, name2 = %@\n, name3= %@\n, name4 = %@\n, name5 = %@\n , name6 = %@\n",name1,name2,name3,name4,name5,name6);
    
//    _p.cat = [[Cat alloc]init];
    [_p setValue:@"凯迪" forKeyPath:@"cat.name"];
//    NSLog(@"Cat Chinese Name = %@",[_p valueForKeyPath:@"cat.name"]);
    
    __block int muti = 10 ;
    self.block = ^int(int num) {
        return muti *num ;
    };
    muti = 6;
    [self execBlock];
    
}

-(void)execBlock{
    int sum =  self.block(4);
    NSLog(@"sum ==%d",sum);
}

#pragma mark - KVO
-(void)setKVO{
    _p = [[Person alloc]init];
    [_p addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew  | NSKeyValueObservingOptionOld context:nil];
    
}

//点击改变对象的名字
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    _p.name = @"leon";
}

//接收改变的新旧值
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    // NSKeyValueChangeNewKey == @"new"
    NSString *new = change[NSKeyValueChangeNewKey];
    // NSKeyValueChangeOldKey == @"old"
    NSString *old = change[NSKeyValueChangeOldKey];
    
    NSLog(@"%@-%@",new,old);
}

@end
