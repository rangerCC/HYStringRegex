//
//  Book.h
//  HYStringRegex
//
//  Created by 恒阳 on 16/8/4.
//  Copyright © 2016年 恒阳. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BookExt.h"

@interface Book : NSObject
/**
 *  book id
 */
@property (nonatomic , strong) NSString *ID;

/**
 *  book name
 */
@property (nonatomic , strong) NSString *n;

/**
 *  book 简介
 */
@property (nonatomic , strong) BookExt *ext;

/**
 *  book 总页数
 */
@property (nonatomic , assign) int p;
@end
