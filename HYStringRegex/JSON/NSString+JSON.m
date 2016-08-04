//
//  NSString+JSON.m
//  HYStringRegex
//
//  Created by 恒阳 on 16/8/4.
//  Copyright © 2016年 恒阳. All rights reserved.
//

#import "NSString+JSON.h"

@implementation NSString (JSON)
- (id)jsonObject {
    NSError *error = nil;
    id result = [NSJSONSerialization JSONObjectWithData:[self dataUsingEncoding:NSUTF8StringEncoding]
                                                options:NSJSONReadingMutableContainers
                                                  error:&error];
    if (error || [NSJSONSerialization isValidJSONObject:result] == NO)
        return nil;
    
    return result;
}
@end
