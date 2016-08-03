//
//  NSObject+KVC.m
//  HYStringRegex
//
//  Created by 恒阳 on 16/8/4.
//  Copyright © 2016年 恒阳. All rights reserved.
//

#import "NSObject+KVC.h"
#import <objc/runtime.h>

@implementation NSObject (KVC)
- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if (value == nil) {
        value = [NSNull null];
    }
    objc_setAssociatedObject(self, (__bridge const void *)(key), value, OBJC_ASSOCIATION_RETAIN);
}

- (id)valueForUndefinedKey:(NSString *)key {
    id target = objc_getAssociatedObject(self, (__bridge const void *)(key));
    if ([target isKindOfClass:[NSNull class]])
        return nil;
    return target;
}
@end
