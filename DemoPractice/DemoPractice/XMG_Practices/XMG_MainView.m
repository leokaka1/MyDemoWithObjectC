//
//  XMG_MainView.m
//  DemoPractice
//
//  Created by Leon on 2019/3/5.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "XMG_MainView.h"
#import "TransValue.h"
#import "Sandbox.h"
#import "NaviDemo.h"
#import "Transform.h"

@interface XMG_MainView ()


@end

@implementation XMG_MainView

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    NSDictionary *dict = [[ConstDictionary new] getXMGMainDictionary];
    self.itemDict = dict;
    MainPageModel *model = [[MainPageModel alloc]initWithDict:dict];
    self.titleArr = model.title;
    self.detailArr = model.detail;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"小马哥练习";
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    
    switch (indexPath.row) {
        case 0:
        {
            TransDict *transDict   = [TransDict new];
            [self.navigationController pushViewController:transDict animated:true];
        }
            break;
            
        case 1:
        {
            UIBasic *uiBasic = [UIBasic new];
            [self.navigationController pushViewController:uiBasic animated:true];
        }
            break;
            
        case 2:
        {
            TransValue *transValue = [TransValue new];
            [self.navigationController pushViewController:transValue animated:true];
        }
            break;
            
        case 3:
        {
            SandBox *sandBox = [SandBox new];
            [self.navigationController pushViewController:sandBox animated:true];
        }
            break;
            
        case 4:
        {
            NaviDemo *naviDemo = [NaviDemo new];
            [self.navigationController pushViewController:naviDemo animated:true];
        }
            break;
            
        case 5:
        {
            TransForm *trans = [TransForm new];
            [self.navigationController pushViewController:trans animated:true];
        }
            break;
            
        default:
            break;
    }
}



@end
