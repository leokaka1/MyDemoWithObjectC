//
//  RuntimePerson+Play.m
//  DemoPractice
//
//  Created by Leon on 2019/3/15.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "RuntimePerson+Play.h"
#import <objc/message.h>

@implementation RuntimePerson (Play)

-(NSString *)gameName{
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setGameName:(NSString *)gameName{
    objc_setAssociatedObject(self,@selector(gameName),gameName,OBJC_ASSOCIATION_COPY_NONATOMIC);
    
    
}

@end
