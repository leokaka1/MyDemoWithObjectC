//
//  NSDictionary+Ext.m
//  E_Stuff_Platform
//
//  Created by even on 15/12/4.
//  Copyright © 2015年 even. All rights reserved.
//

#import "NSDictionary+Ext.h"
#import <objc/runtime.h>

@implementation NSDictionary (Ext)
+ (NSString*)toJson {
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString {
  if (jsonString == nil) {
    return nil;
  }
  
  NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
  NSError *err;
  NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                      options:NSJSONReadingMutableContainers
                                                        error:&err];
  if(err) {
    NSLog(@"json解析失败：%@",err);
    return nil;
  }
  
  return dic;
}

- (NSString *)jsonString {
  NSData *infoJsonData = [NSJSONSerialization dataWithJSONObject:self
                                                         options:NSJSONWritingPrettyPrinted
                                                           error:nil];
  NSString *json = [[NSString alloc] initWithData:infoJsonData encoding:NSUTF8StringEncoding];
  
  return json;
}

- (id)safeObjectForKey:(id<NSCopying>)aKey {
  if (aKey == nil) {
    return nil;
  }
  
  return [self objectForKey:aKey];
}

- (int)intValueForKey:(id)key {
  id obj = [self safeObjectForKey:key];
  
  if ([obj respondsToSelector:@selector(intValue)]) {
    return [obj intValue];
  }
  
  return 0;
}

- (double)doubleValueForKey:(id)key {
  id obj = [self safeObjectForKey:key];
  
  if ([obj respondsToSelector:@selector(doubleValue)]) {
    return [obj doubleValue];
  }
  
  return 0.0;
}

- (float)floatValueForKey:(id)key {
  id obj = [self safeObjectForKey:key];
  
  if ([obj respondsToSelector:@selector(floatValue)]) {
    return [obj floatValue];
  }
  
  return 0.0f;
}

- (NSInteger)integerValueForKey:(id)key {
  id obj = [self safeObjectForKey:key];
  
  if ([obj respondsToSelector:@selector(integerValue)]) {
    return [obj integerValue];
  }
  
  return 0;
}

- (NSString *)stringValueForKey:(id)key {
  id obj = [self safeObjectForKey:key];
  
  if ([obj respondsToSelector:@selector(stringValue)]) {
    return [obj stringValue];
  }
  
  return nil;
}

- (NSDictionary *)dictionaryValueForKey:(id)key {
  id obj = [self safeObjectForKey:key];
  
  if ([obj isKindOfClass:[NSDictionary class]]) {
    return (NSDictionary *)obj;
  }
  
  return nil;
}

- (NSArray *)arrayValueForKey:(id)key {
  id obj = [self safeObjectForKey:key];
  
  if ([obj isKindOfClass:[NSArray class]]) {
    return (NSArray *)obj;
  }
  
  return nil;
}

- (NSNumber *)numberValueForKey:(id)key {
  id obj = [self safeObjectForKey:key];
  
  if ([obj isKindOfClass:[NSNumber class]]) {
    return (NSNumber *)obj;
  }
  
  return nil;
}


+(void)dictionaryWithObject:(id)obj class:(Class)class toDictionary:(NSMutableDictionary*)dict
{
    unsigned count;
    objc_property_t *properties = class_copyPropertyList(class, &count);
    for (int i=0; i <count; i++) {
        NSString *key = [NSString stringWithUTF8String:property_getName(properties[i])];
        id object = [obj valueForKey:key];
        Class classObject = object_getClass(object);
        if ([object isKindOfClass:[NSString class]] ||
            [object isKindOfClass:[NSNumber class]] ||
            [object isKindOfClass:[NSNull class]]) {
            [dict setObject:object forKey:key];
        }
        else if([object isKindOfClass:[NSArray class]]){
            NSMutableArray *subObj = [NSMutableArray array];
            for (id item in object) {
                [subObj addObject:[self dictionaryWithObject:item]];
            }
            [dict setObject:subObj forKey:key];
        }
        else if ([object isKindOfClass:[NSDictionary class]] || classObject){
            id subObj = [self dictionaryWithObject:object];
            [dict setObject:subObj forKey:key];
        }else{
            if (object) {
                [dict setObject:object forKey:key];
            }
        }
    }
    free(properties);
    //获取父类属性
    Class superClass = class_getSuperclass(class);
    if (superClass != [NSObject class]) {
        [self dictionaryWithObject:obj class:superClass toDictionary:dict];
    }
}

+(NSMutableDictionary*)dictionaryWithObject:(id)obj
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [self dictionaryWithObject:obj class:[obj class] toDictionary:dict];
    return dict;
}


#if DEBUG
- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level {
    NSMutableString *desc = [NSMutableString string];
    
    NSMutableString *tabString = [[NSMutableString alloc] initWithCapacity:level];
    for (NSUInteger i = 0; i < level; ++i) {
        [tabString appendString:@"\t"];
    }
    
    NSString *tab = @"";
    if (level > 0) {
        tab = tabString;
    }
    
    [desc appendString:@"\t{\n"];
    
    // 遍历数组,self就是当前的数组
    for (id key in self.allKeys) {
        id obj = [self objectForKey:key];
        
        if ([obj isKindOfClass:[NSString class]]) {
            [desc appendFormat:@"%@\t%@ = \"%@\",\n", tab, key, obj];
        } else if ([obj isKindOfClass:[NSArray class]]
                   || [obj isKindOfClass:[NSDictionary class]]
                   || [obj isKindOfClass:[NSSet class]]) {
            [desc appendFormat:@"%@\t%@ = %@,\n", tab, key, [obj descriptionWithLocale:locale indent:level + 1]];
        } else if ([obj isKindOfClass:[NSData class]]) {
            // 如果是NSData类型，尝试去解析结果，以打印出可阅读的数据
            NSError *error = nil;
            NSObject *result =  [NSJSONSerialization JSONObjectWithData:obj
                                                                options:NSJSONReadingMutableContainers
                                                                  error:&error];
            // 解析成功
            if (error == nil && result != nil) {
                if ([result isKindOfClass:[NSDictionary class]]
                    || [result isKindOfClass:[NSArray class]]
                    || [result isKindOfClass:[NSSet class]]) {
                    NSString *str = [((NSDictionary *)result) descriptionWithLocale:locale indent:level + 1];
                    [desc appendFormat:@"%@\t%@ = %@,\n", tab, key, str];
                } else if ([obj isKindOfClass:[NSString class]]) {
                    [desc appendFormat:@"%@\t%@ = \"%@\",\n", tab, key, result];
                }
            } else {
                @try {
                    NSString *str = [[NSString alloc] initWithData:obj encoding:NSUTF8StringEncoding];
                    if (str != nil) {
                        [desc appendFormat:@"%@\t%@ = \"%@\",\n", tab, key, str];
                    } else {
                        [desc appendFormat:@"%@\t%@ = %@,\n", tab, key, obj];
                    }
                }
                @catch (NSException *exception) {
                    [desc appendFormat:@"%@\t%@ = %@,\n", tab, key, obj];
                }
            }
        } else {
            [desc appendFormat:@"%@\t%@ = %@,\n", tab, key, obj];
        }
    }
    
    [desc appendFormat:@"%@}", tab];
    
    return desc;
}
#endif
@end
