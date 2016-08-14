//
//  main.m
//  HYStringRegex
//
//  Created by 恒阳 on 16/8/3.
//  Copyright © 2016年 恒阳. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

//#import <Foundation/Foundation.h>
//#import <objc/runtime.h>
//#import <objc/message.h>

//#pragma mark - Tool
//static void greeting(id self,SEL _cmd)
//{
//    NSLog(@"self : %@ , selector : %@",self,NSStringFromSelector(_cmd));
//}
//
//void registerNewClass()
//{
//    Class dynaClass = objc_allocateClassPair([NSObject class],"dynaClass",0);
//    
//    Method description = class_getInstanceMethod([NSObject class], @selector(description));
//    const char *types = method_getTypeEncoding(description);
//    class_addMethod(dynaClass, @selector(greeting), (IMP)greeting, types);
//    
//    objc_registerClassPair(dynaClass);
//    
//    id dynaObj = [[dynaClass alloc] init];
//    NSLog(@"%@",objc_msgSend(dynaObj,NSSelectorFromString(@"greeting")));
//}

int main(int argc, char * argv[]) {
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
