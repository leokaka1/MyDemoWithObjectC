//
//  KutilManager.h
//  DemoPractice
//
//  Created by Leon on 2019/3/7.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface KutilManager : NSObject

+(instancetype)shareManager;


//颜色转image
+(UIImage*) createImageWithColor:(UIColor*) color;

@end

NS_ASSUME_NONNULL_END
