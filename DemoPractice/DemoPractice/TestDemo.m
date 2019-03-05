//
//  TestDemo.m
//  DemoPractice
//
//  Created by Leon on 2019/3/4.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "TestDemo.h"
#import "PersonModel.h"

@interface TestDemo ()

@property(strong,nonatomic) NSMutableArray  *blockArr;
@property(strong,nonatomic) UIView *bacView;
@property(strong,nonatomic) NSArray *array;

@end

@implementation TestDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupDataSource];
    [self setupUI];
    
//    NSArray *dict  = @[@{@"name":@"leon",@"age":@"18"},@{@"name":@"leon",@"age":@"19"},@{@"name":@"soul",@"age":@"21"},@{@"name":@"giva",@"age":@"19"}];
//    BOOL isSuccess = [dict writeToFile:@"/Users/Leon/Desktop/person.plist" atomically:true];
//    if (isSuccess) {
//        NSLog(@"写入成功");
//    }
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"person" ofType:@"plist"];
    NSArray *person = [NSArray arrayWithContentsOfFile:path];
//    NSLog(@"%@",person);
    NSMutableArray *tempArr = [NSMutableArray array];
    
    _array = [NSArray array];
    for (NSDictionary *dict in person) {
        
        PersonModel *model  = [[PersonModel alloc]initWithDict:dict];
        [tempArr addObject:model];
    }
    
    _array = tempArr;
    
    PersonModel *model = _array[1];
    NSLog(@"%@",model.name);
    
    UIButton *button = [UIButton new];
    
    
}

-(void)setupDataSource{
    _blockArr = [NSMutableArray array];
//    _blockArr
}

-(void)add{
    
    for (id contenView in self.bacView.subviews) {
        if ([contenView isKindOfClass:[UIView class]]) {
            [contenView removeFromSuperview];
        }
    }
    
    [self addBlock:1];
    
    CGFloat margin = 10;
    CGFloat height = 30;
    for (int i = 0; i < _blockArr.count; i++) {
        UIView *redView = [[UIView alloc]init];
        int count = 5;
        CGFloat w = (self.bacView.frame.size.width - 4*margin) / 5;
//        CGFloat x =  i* (margin+w);
//        CGFloat y = margin;
        int row = i % count;
        int col = i / count;
        
        redView.frame = CGRectMake(row *(w + margin), margin + col *(height + margin), w, 30);
        redView.backgroundColor  = [UIColor redColor];
        [self.bacView addSubview:redView];
    }
}

-(void)addBlock:(int)count{
    for (int i = 0 ; i<count; i++) {
        [_blockArr addObject:[NSString stringWithFormat:@"%d",i]];
    }
}

-(void)setupUI{
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *plusButton = [[UIButton alloc]init];
    [plusButton setTitle:@"+" forState:UIControlStateNormal];
    plusButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [plusButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    plusButton.frame = CGRectMake(100, 100, 0, 0 );
    [plusButton sizeToFit];
    [plusButton addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:plusButton];
    
    
    UIButton *minusButton = [[UIButton alloc]init];
    [minusButton setTitle:@"-" forState:UIControlStateNormal];
    [minusButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    minusButton.titleLabel.font = [UIFont systemFontOfSize:18];
    minusButton.frame = CGRectMake(kScreenWidth  - 100, 100, 0, 0 );
    [minusButton sizeToFit];
    [self.view addSubview:minusButton];
    
    self.bacView = [[UIView alloc]init];
    self.bacView.frame = CGRectMake(20, 200, kScreenWidth - 40, 300);
    self.bacView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.bacView];
    
}


@end
