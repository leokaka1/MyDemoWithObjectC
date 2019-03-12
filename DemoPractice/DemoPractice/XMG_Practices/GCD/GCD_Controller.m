//
//  GCD_Controller.m
//  DemoPractice
//
//  Created by Leon on 2019/3/12.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "GCD_Controller.h"

@interface GCD_Controller ()

@property(assign,nonatomic) int count;

@end

@implementation GCD_Controller

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"GCD";
    self.count = 30;
//    [self test1];
//    [self test2];
//    [self test3];
//    [self test4];
//    [self test5]
    [self test6];
}

-(void)test1{
//    同步串行队列
    dispatch_queue_t queue = dispatch_queue_create("queue", DISPATCH_QUEUE_SERIAL);
    
    for (int i = 0; i < 3; i++) {
        dispatch_sync(queue, ^{
            NSLog(@"task1 ----- %@",[NSThread currentThread]);
        });
    }
    
    for (int i = 0; i < 3; i++) {
        dispatch_sync(queue, ^{
            NSLog(@"task2 ----- %@",[NSThread currentThread]);
        });
    }
    
    for (int i = 0; i < 3; i++) {
        dispatch_sync(queue, ^{
            NSLog(@"task3 ----- %@",[NSThread currentThread]);
        });
    }
}

-(void)test2{
//    同步并发队列(跟同步一致)
    dispatch_queue_t queue = dispatch_queue_create("queue", DISPATCH_QUEUE_CONCURRENT);
    
    for (int i = 0; i < 3; i++) {
        dispatch_sync(queue, ^{
            NSLog(@"task1 ----- %@",[NSThread currentThread]);
        });
    }
    
    for (int i = 0; i < 3; i++) {
        dispatch_sync(queue, ^{
            NSLog(@"task2 ----- %@",[NSThread currentThread]);
        });
    }
    
    for (int i = 0; i < 3; i++) {
        dispatch_sync(queue, ^{
            NSLog(@"task3 ----- %@",[NSThread currentThread]);
        });
    }
}

-(void)test3{
//    异步串行
    dispatch_queue_t queue = dispatch_queue_create("queue", DISPATCH_QUEUE_SERIAL);
    
    for (int i = 0; i < 3; i++) {
        dispatch_async(queue, ^{
            NSLog(@"task1 ----- %@",[NSThread currentThread]);
        });
    }
    
    for (int i = 0; i < 3; i++) {
        dispatch_async(queue, ^{
            NSLog(@"task2 ----- %@",[NSThread currentThread]);
        });
    }
    
    for (int i = 0; i < 3; i++) {
        dispatch_async(queue, ^{
            NSLog(@"task3 ----- %@",[NSThread currentThread]);
        });
    }
}

-(void)test4{
//    异步并发队列
//    dispatch_queue_t queue = dispatch_queue_create("queue", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    for (int i = 0; i < 3; i++) {
        dispatch_async(queue, ^{
            NSLog(@"task1 ----- %@",[NSThread currentThread]);
        });
    }
    
    for (int i = 0; i < 3; i++) {
        dispatch_async(queue, ^{
            NSLog(@"task2 ----- %@",[NSThread currentThread]);
        });
    }
    
    for (int i = 0; i < 3; i++) {
        dispatch_async(queue, ^{
            NSLog(@"task3 ----- %@",[NSThread currentThread]);
        });
    }
}

-(void)test5{
//    组队列
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_group_async(group, queue, ^{
        for (int i = 0; i < 3; i++) {
            dispatch_async(queue, ^{
                NSLog(@"task1 ----- %@",[NSThread currentThread]);
            });
        }
        
        for (int i = 0; i < 3; i++) {
            dispatch_async(queue, ^{
                NSLog(@"task2 ----- %@",[NSThread currentThread]);
            });
        }
    });
    
    dispatch_group_notify(group, queue, ^{
        for (int i = 0; i < 3; i++) {
            dispatch_async(queue, ^{
                NSLog(@"task3 ----- %@",[NSThread currentThread]);
            });
        }
    });
    
}

//线程锁
-(void)test6{
//    卖票的例子
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0 );
    dispatch_async(queue, ^{
        for (int i = 0; i<3; i++) {
            [self saleTicket];
        }
    });
    
    dispatch_async(queue, ^{
        for (int i = 0; i<3; i++) {
            [self saleTicket];
        }
    });
    
}

-(void)saleTicket{
    
    @synchronized (self) {
        while (1) {
            [NSThread sleepForTimeInterval:1];
            if (self.count > 0 ) {
                _count--;
                NSLog(@"票剩余---%d",_count);
            }else{
                NSLog(@"票卖完了");
                break;
            }
        }
    }
    
    
}

@end
