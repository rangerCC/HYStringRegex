//
//  UIColor+HY.m
//  HYStringRegex
//
//  Created by 恒阳 on 16/8/3.
//  Copyright © 2016年 恒阳. All rights reserved.
//

#import "UIColor+HY.h"

@implementation UIColor (HY)
+(UIColor*)colorWithRGB:(NSUInteger)hex
                  alpha:(CGFloat)alpha {
    float r, g, b, a;
    a = alpha;
    b = hex & 0x0000FF;
    hex = hex >> 8;
    g = hex & 0x0000FF;
    hex = hex >> 8;
    r = hex;
    
    return [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a];
}

+ (UIColor *)colorFromRGB:(NSInteger)rgbValue {
    return [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0
                           green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0
                            blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0];
    
}
@end
