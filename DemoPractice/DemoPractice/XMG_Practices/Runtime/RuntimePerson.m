//
//  RuntimePerson.m
//  DemoPractice
//
//  Created by Leon on 2019/3/15.
//  Copyright © 2019 Leon 笑 竹. All rights reserved.
//

#import "RuntimePerson.h"
#import <objc/message.h>



@implementation RuntimePerson

void fuckImp (void){
    NSLog(@"fuck")
}

-(void)run{
    NSLog(@"run 了一下");
}

-(void)play{
    NSLog(@"play 了一下")
}

-(void)sing{
    NSLog(@"sing 了一下")
}
/*返回标识符意思
 *Code          Meaning
 c           A char
 i              An int
 s           A short
 l            A long
 l           is treated as a 32-bit quantity on 64-bit programs.
 q          A long long
 C           An unsigned char
 I           An unsigned int
 S          An unsigned short
 L          An unsigned long
 Q        An unsigned long long
 f          A float
 d          A double
 B           A C++ bool or a C99 _Bool
 v          A void
 *           A character string (char *)
 @       An object (whether statically typed or typed id)
 #          A class object (Class)
 :          A method selector (SEL)
 [array type]   An array
 {name=type...}         A structure
 (name=type...)         A union
 bnum                       A bit field of num bits
 ^type              A pointer to type
 ?                          An unknown type (among other things, this code is used for function pointers)
 */
//+(BOOL)resolveInstanceMethod:(SEL)sel{
//    if (sel == sel_registerName("eat")) {
//        class_addMethod(self, sel_registerName("eat"), imp_implementationWithBlock(^(){
//            NSLog(@"eat");
//            return 2;
//        }), "i@:");
//    }
//    return YES;
//}

+(void)load{
    Method play = class_getInstanceMethod(self, @selector(play));
    Method sing = class_getInstanceMethod(self, @selector(sing));
    method_exchangeImplementations(play, sing);
}

//-(id)forwardingTargetForSelector:(SEL)aSelector{
//    if (aSelector  == sel_registerName("eat")) {
//        return objc_msgSend(objc_msgSend(objc_getClass("RunTimeDog"),sel_registerName("alloc")),sel_registerName("init"));
//    }
//    return nil;
//}

+ (BOOL)resolveInstanceMethod:(SEL)sel{
    if (sel == @selector(fuck)) {
        class_addMethod(self, @selector(fuck), (IMP)fuckImp, "v@:");
        return YES;
    }else{
        return [super resolveInstanceMethod:sel];
    }
}



@end
