//
//  ViewController.m
//  HYStringRegex
//
//  Created by 恒阳 on 16/8/3.
//  Copyright © 2016年 恒阳. All rights reserved.
//

#import "ViewController.h"
#import "NSString+HYRegex.h"
#import "UIColor+HY.h"
#import "UIFont+HY.h"
#import "KeyboardManager.h"

#define TEXTFIELD_WIDTH 200.0
#define TEXTFIELD_HEIGHT 44.0

@interface ViewController ()<UITextFieldDelegate>
@property (nonatomic , strong) UITextField *emailTextField;
@end

@implementation ViewController
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"字符串校验";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.emailTextField];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(onTextFieldDidChanged:)
                                                 name:UITextFieldTextDidChangeNotification
                                               object:nil];
    
    // 设置当前页面防止键盘遮挡效果
    [IQKeyboardManager sharedManager].enable = YES;
    // 设置点击背景收回键盘
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    CGFloat sideX = (self.view.frame.size.width-TEXTFIELD_WIDTH)/2.0;
    CGFloat sideY = self.navigationController.navigationBar.frame.size.height + 40.0;
    
    self.emailTextField.frame = CGRectMake(sideX, sideY, TEXTFIELD_WIDTH, TEXTFIELD_HEIGHT);
    sideY += 10+TEXTFIELD_HEIGHT;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TextFields
- (UITextField *)emailTextField
{
    if (!_emailTextField) {
        _emailTextField = [[UITextField alloc] initWithFrame:CGRectZero];
        _emailTextField.textColor = [UIColor colorFromRGB:0x202325];
        _emailTextField.font = [UIFont getHeitiSCFont:14];
        _emailTextField.textAlignment = NSTextAlignmentCenter;
        _emailTextField.backgroundColor = [UIColor clearColor];
        _emailTextField.placeholder = @"请输入邮箱";
        _emailTextField.layer.borderColor = [UIColor lightGrayColor].CGColor;
        _emailTextField.layer.borderWidth = 0.5;
        _emailTextField.layer.cornerRadius = 4.0;
    }
    return _emailTextField;
}

#pragma mark - Notification Action
- (void)onTextFieldDidChanged:(NSNotification *)notification
{
    UITextField *textField = notification.object;
    if (![textField isKindOfClass:[UITextField class]]) {
        return;
    }
    
    if ([textField.text isValidEmail]) {
        textField.layer.borderColor = [UIColor greenColor].CGColor;
    } else {
        textField.layer.borderColor = [UIColor redColor].CGColor;
    }
}

@end
