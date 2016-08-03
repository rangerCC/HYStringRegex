//
//  HYContentView.h
//  HYStringRegex
//
//  Created by 恒阳 on 16/8/4.
//  Copyright © 2016年 恒阳. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYContentView : UIScrollView
{
    NSMutableArray *_subModules;
}

/**
 *  子View间距
 */
@property (nonatomic,assign) CGFloat margin;

/**
 *  添加子View
 *
 *  @param subview 子View
 */
- (void)addModule:(UIView *)subview;

/**
 *  添加支持带边界空隙的子View
 *
 *  @param subview    子View
 *  @param needMargin 是否需要边界
 */
- (void)addModule:(UIView *)subview needMargin:(BOOL)needMargin;

/**
 *  在某个子View上方插入另一个子View
 *
 *  @param above      待插入子View
 *  @param below      插入到该子View上方
 *  @param needMargin 是否需要间隔
 */
- (void)insertModule:(UIView *)above beforeModule:(UIView *)below needMargin:(BOOL)needMargin;

/**
 *  在某个子View下方插入另一个子View
 *
 *  @param below      待插入子View
 *  @param above      插入到某个子View后
 *  @param needMargin 是否需要支持边界
 */
- (void)insertModule:(UIView *)below behindModule:(UIView *)above needMargin:(BOOL)needMargin;

/**
 *  替换某个子View
 *
 *  @param oldView 被替换的子View
 *  @param subview 新的子View
 */
- (void)replaceModule:(UIView *)oldView withNewModule:(UIView *)subview;

/**
 *  删除某个子View
 *
 *  @param subview 待删除的View
 */
- (void)removeModule:(UIView *)subview;

/**
 *  删除所有子View
 */
- (void)removeAllModules;
@end
