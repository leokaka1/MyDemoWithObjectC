//
//  XZ_VerifyTools.h
//  DemoPractice
//
//  Created by Leon on 2019/3/19.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XZ_VerifyTools : NSObject

+(instancetype)sharedManager;

- (BOOL)isCorrectIdNo:(NSString *)IDNumber;

- (BOOL)isValidFixLine:(NSString *)string;

- (BOOL)isValidMobile:(NSString *)string;

- (BOOL)isValidCardId:(NSString *)string;

- (BOOL)isDiagitals:(NSString *)string;

- (BOOL)isValidPayPsd:(NSString *)string;

- (BOOL)isValidPsd:(NSString *)string;

- (BOOL)isOnlySixWordNumber:(NSString *)string;

- (BOOL)isOnlyWordNumber:(NSString *)string;

- (BOOL)isOnlyNumber:(NSString *)string;

- (BOOL)isPureFloat:(NSString*)string;

-(BOOL)isValidBrithDay:(NSString *)string;

-(BOOL)validateNickname:(NSString *)nickname;

- (BOOL)isValidateRecommendName:(NSString *)nickname;

//身份证正则表达式
- (BOOL)accurateVerifyIDCardNumber:(NSString *)value;

//只允许输入中文
- (BOOL) isOnlyChieseName:(NSString *)chineseName;

- (BOOL)isChinese:(NSString *)name;


- (BOOL)isMobileNumber:(NSString *)mobileNum;

- (BOOL)isContainWordAndNum:(NSString *)string;

@end

NS_ASSUME_NONNULL_END
