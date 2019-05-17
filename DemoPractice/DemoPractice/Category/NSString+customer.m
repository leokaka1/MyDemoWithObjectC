//
//  NSString+customer.m
//  DemoPractice
//
//  Created by Leon on 2019/3/28.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "NSString+customer.h"

@implementation NSString (customer)

-(NSString*)reverseString{

    NSMutableString *mString = [NSMutableString stringWithCapacity:self.length];
    for (NSInteger i = self.length-1; i>=0; i--) {
        [mString appendString: [self substringWithRange:NSMakeRange(i, 1)]];
        //        [mString appendString: [string stringByReplacingCharactersInRange:NSMakeRange(i, 1) withString:@"***"]];
    }
    return mString;
}

@end
