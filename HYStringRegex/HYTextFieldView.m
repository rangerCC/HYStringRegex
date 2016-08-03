//
//  HYTextFieldView.m
//  HYStringRegex
//
//  Created by 恒阳 on 16/8/3.
//  Copyright © 2016年 恒阳. All rights reserved.
//

#import "HYTextFieldView.h"

#import "UIColor+HY.h"
#import "UIFont+HY.h"

@interface HYTextFieldView ()
@property (nonatomic , strong)UITextField *textField;
@end

@implementation HYTextFieldView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        [self addSubview:self.textField];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.textField.frame = self.bounds;
}

+ (HYTextFieldView *)defaultTextField:(HYTextFieldViewType)type
{
    HYTextFieldView *textField = [[HYTextFieldView alloc] initWithFrame:CGRectZero];
    textField.type = type;
    
    return textField;
}

- (void)setType:(HYTextFieldViewType)type
{
    _type = type;
    
    switch (_type) {
        case HY_Email:
            self.textField.placeholder = @"请输入邮箱";
            break;
            
        case HY_Phone:
            self.textField.placeholder = @"请输入手机号";
            break;
            
        case HY_IDCard:
            self.textField.placeholder = @"请输入身份证号";
            break;
            
        case HY_IPAddress:
            self.textField.placeholder = @"请输入ip地址";
            break;
            
        case HY_Account:
            self.textField.placeholder = @"请输入用户账户";
            break;
            
        case HY_TaxNumber:
            self.textField.placeholder = @"请输入ip工商税号";
            break;
            
        default:
            break;
    }
}

- (NSString *)text
{
    return self.textField.text;
}

- (UITextField *)textField
{
    if (!_textField) {
        _textField = [[UITextField alloc] initWithFrame:CGRectZero];
        _textField.textColor = [UIColor colorFromRGB:0x202325];
        _textField.font = [UIFont getHeitiSCFont:14];
        _textField.textAlignment = NSTextAlignmentCenter;
        _textField.backgroundColor = [UIColor clearColor];
        _textField.placeholder = @"请输入字符串";
        _textField.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _textField.layer.borderWidth = 0.5;
        _textField.layer.cornerRadius = 4.0;
    }
    
    return _textField;
}
@end
