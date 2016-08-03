//
//  UIFont+HY.m
//  HYStringRegex
//
//  Created by 恒阳 on 16/8/3.
//  Copyright © 2016年 恒阳. All rights reserved.
//

#import "UIFont+HY.h"

@implementation UIFont (HY)
+ (UIFont *)getHeitiSCFont:(float)fontSize {
    return [UIFont fontWithName:@"HelveticaNeue"
                           size:fontSize];
}

+ (UIFont *)getHeitiSCBoldFont:(float)fontSize {
    return [UIFont fontWithName:@"HelveticaNeue-Bold"
                           size:fontSize];
}
@end
