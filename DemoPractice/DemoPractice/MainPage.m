//
//  MainPage.m
//  DemoPractice
//
//  Created by Leon on 2019/3/4.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "MainPage.h"
#import "MainPage+OtherFunction.h"
#import "Person.h"

static NSString *identifier = @"cell";

@interface MainPage ()




@end

@implementation MainPage

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSDictionary *dict = [[ConstDictionary new] getMainDictionary];
    self.itemDict = dict;
    MainPageModel *model = [[MainPageModel alloc]initWithDict:dict];
    self.titleArr = model.title;
    self.detailArr = model.detail;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    
    switch (indexPath.row) {
        case 0:
            {
                XMG_MainView *xmgMain   = [XMG_MainView new];
                [self.navigationController pushViewController:xmgMain animated:true];
            }
            break;
            
        case 1:
        {
            TestDemo *testDemo = [TestDemo new];
            [self.navigationController pushViewController:testDemo animated:true];
        }
            break;
            
        default:
            break;
    }
}

@end
