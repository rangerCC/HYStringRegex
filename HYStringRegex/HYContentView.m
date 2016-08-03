//
//  HYContentView.m
//  HYStringRegex
//
//  Created by 恒阳 on 16/8/4.
//  Copyright © 2016年 恒阳. All rights reserved.
//

#import "HYContentView.h"

@implementation HYContentView
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _subModules = [NSMutableArray new];
        _margin = 10.0;
        self.contentSize = CGSizeMake(0, 0);
    }
    return self;
}

- (void)dealloc {
    [_subModules removeAllObjects];
    _subModules = nil;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat y = 0.0f;
    for (NSUInteger i=0,count=[_subModules count]; i<count; i++) {
        UIView *subview = [_subModules objectAtIndex:i];
        NSNumber* needMargin = [subview valueForKey:@"needMargin"];
        if (i > 0 && [needMargin boolValue]) {
            y += self.margin;
        }
        CGRect frame = subview.frame;
        frame.origin.y = y;
        subview.frame = frame;
        y += frame.size.height;
    }
    CGSize size = self.contentSize;
    size.height = y;
    self.contentSize = size;
}

#pragma mark - 对外接口
- (void)addModule:(UIView *)subview {
    [self addModule:subview needMargin:YES];
}

- (void)addModule:(UIView *)subview needMargin:(BOOL)needMargin {
    [subview setValue:[NSNumber numberWithBool:needMargin]
               forKey: @"needMargin"];
    
    [_subModules addObject:subview];
    
    CGFloat sectionInset = 0.0f;
    if ([_subModules count] > 0 && needMargin) {
        sectionInset = self.margin;
    }
    CGRect frame = subview.frame;
    CGSize size = self.contentSize;
    
    frame.origin.x = 0;
    frame.origin.y = size.height + sectionInset;
    subview.frame = frame;
    
    [self addSubview:subview];
    
    if (needMargin) {
        size.height += sectionInset;
    }
    size.height += frame.size.height;
    self.contentSize = size;
}

- (void)insertModule:(UIView *)above beforeModule:(UIView *)below needMargin:(BOOL)needMargin{
    __block NSUInteger index;
    [_subModules enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id obj, NSUInteger idx, BOOL *stop){
        if (below == obj) {
            index = idx;
            *stop = YES;
        }
    }];
    [above setValue:[NSNumber numberWithBool:needMargin]
             forKey: @"needMargin"];
    
    [_subModules insertObject:above atIndex:index];
    CGFloat sectionInset = 0.0f;
    if (needMargin) {
        sectionInset = self.margin;
    }
    CGRect frame = above.frame;
    CGSize size = self.contentSize;
    
    frame.origin.x = 0;
    frame.origin.y = size.height + sectionInset;
    above.frame = frame;
    
    [self insertSubview:above atIndex:index];
    
    if (needMargin) {
        size.height += sectionInset;
    }
    size.height += frame.size.height;
    self.contentSize = size;
}

- (void)insertModule:(UIView *)below behindModule:(UIView *)above needMargin:(BOOL)needMargin {
    __block NSUInteger index;
    [_subModules enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id obj, NSUInteger idx, BOOL *stop){
        if (above == obj) {
            index = idx;
            *stop = YES;
        }
    }];
    [below setValue:[NSNumber numberWithBool:needMargin]
             forKey: @"needMargin"];
    
    [_subModules insertObject:below atIndex:index+1];
    CGFloat sectionInset = 0.0f;
    if (needMargin) {
        sectionInset = self.margin;
    }
    CGRect frame = below.frame;
    CGSize size = self.contentSize;
    
    frame.origin.x = 0;
    frame.origin.y = size.height + sectionInset;
    below.frame = frame;
    
    [self insertSubview:below atIndex:index+1];
    
    if (needMargin) {
        size.height += sectionInset;
    }
    size.height += frame.size.height;
    self.contentSize = size;
}

- (void)replaceModule:(UIView *)oldView withNewModule:(UIView *)subview {
    NSInteger index = [_subModules indexOfObject:oldView];
    if (index == NSNotFound) {
        return;
    }
    
    CGSize size = self.contentSize;
    size.height -= oldView.frame.size.height;
    size.height += subview.frame.size.height;
    self.contentSize = size;
    
    [_subModules replaceObjectAtIndex:index withObject:subview];
    [subview setValue:[oldView valueForKey:@"needMargin"] forKey:@"needMargin"];
    [self insertSubview:subview aboveSubview:oldView];
    [oldView removeFromSuperview];
    
}

- (void)removeModule:(UIView *)subview {
    NSInteger index = [_subModules indexOfObject:subview];
    if (index == NSNotFound) {
        return;
    }
    CGSize size = self.contentSize;
    size.height -= subview.frame.size.height;
    self.contentSize = size;
    [_subModules removeObject:subview];
    [subview removeFromSuperview];
}

- (void)removeAllModules {
    [_subModules removeAllObjects];
    
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    
    [self layoutSubviews];
}

#pragma mark - action
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self endEditing:YES];
}

@end
