//
//  UIColor+HY.h
//  HYStringRegex
//
//  Created by 恒阳 on 16/8/3.
//  Copyright © 2016年 恒阳. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HY)

+ (UIColor*)colorWithRGB:(NSUInteger)hex
                  alpha:(CGFloat)alpha;

+ (UIColor *)colorFromRGB:(NSInteger)rgbValue;
@end
