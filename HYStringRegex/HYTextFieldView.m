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

#define TEXTFIELD_WIDTH 200.0
#define TEXTFIELD_HEIGHT 44.0

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
    
    CGFloat sideX = (self.frame.size.width-TEXTFIELD_WIDTH)/2.0;
    self.textField.frame = CGRectMake(sideX, 0, TEXTFIELD_WIDTH, TEXTFIELD_HEIGHT);
}

+ (HYTextFieldView *)defaultTextField:(HYTextFieldViewType)type
{
    HYTextFieldView *textField = [[HYTextFieldView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, TEXTFIELD_HEIGHT)];
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
            
        case HY_URL:
            self.textField.placeholder = @"请输入url链接";
            break;
            
        case HY_Account:
            self.textField.placeholder = @"请输入用户账户(首字符为字母或下划线，长度4-12位，不能包含中文)";
            break;
            
        case HY_Chinese:
            self.textField.placeholder = @"请输入纯汉字";
            break;
            
        case HY_Postalcode:
            self.textField.placeholder = @"请输入邮政编码";
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
