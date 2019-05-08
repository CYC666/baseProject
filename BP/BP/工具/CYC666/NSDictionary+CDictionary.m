//
//  NSDictionary+CDictionary.m
//  skZone
//
//  Created by sm on 2019/4/16.
//  Copyright © 2019 MAC. All rights reserved.
//

#import "NSDictionary+CDictionary.h"

@implementation NSDictionary (CDictionary)



+ (void)load {
    
    [super load];
    
//    // 黑魔法 Method Swizzling
//    Method fromMethod = class_getInstanceMethod(objc_getClass("__NSDictionaryI"), @selector(setObject:forKey:));
//    Method toMethod = class_getInstanceMethod(objc_getClass("__NSDictionaryI"), @selector(swizzling_setObject:withKey:));
//
//    if (!class_addMethod([self class], @selector(viewDidLoad), method_getImplementation(toMethod), method_getTypeEncoding(toMethod))) {
//        method_exchangeImplementations(fromMethod, toMethod);
//    }
    
}

//- (void)swizzling_setObject:(id)object withKey:(id)key {
//
//    if (kObjectIsEmpty(object)) {
//        // 这里做一下异常处理，不然都不知道出错了。
//        @try {
//            return [self swizzling_setObject:object withKey:key];
//        }
//        @catch (NSException *exception) {
//            // 在崩溃后会打印崩溃信息，方便我们调试。
//            NSLog(@"---------- %s Crash Because Method %s  ----------\n", class_getName(self.class), __func__);
//            NSLog(@"%@", [exception callStackSymbols]);
//        }
//        @finally {}
//    } else {
//        return [self swizzling_setObject:object withKey:key];
//    }
//
//
//}




@end
