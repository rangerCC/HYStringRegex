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

#import "HYTextFieldView.h"

#define TEXTFIELD_WIDTH 200.0
#define TEXTFIELD_HEIGHT 44.0

@interface ViewController ()<UITextFieldDelegate>
@property (nonatomic , strong) HYTextFieldView *emailTextField;
@property (nonatomic , strong) HYTextFieldView *phoneTextField;
@property (nonatomic , strong) HYTextFieldView *ipTextField;
@property (nonatomic , strong) HYTextFieldView *idcardTextField;
@property (nonatomic , strong) HYTextFieldView *accountTextField;
@property (nonatomic , strong) HYTextFieldView *taxNumberTextField;
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
    [self.view addSubview:self.phoneTextField];
    [self.view addSubview:self.ipTextField];
    [self.view addSubview:self.idcardTextField];
    [self.view addSubview:self.accountTextField];
    [self.view addSubview:self.taxNumberTextField];
    
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
    
    self.phoneTextField.frame = CGRectMake(sideX, sideY, TEXTFIELD_WIDTH, TEXTFIELD_HEIGHT);
    sideY += 10+TEXTFIELD_HEIGHT;
    
    self.idcardTextField.frame = CGRectMake(sideX, sideY, TEXTFIELD_WIDTH, TEXTFIELD_HEIGHT);
    sideY += 10+TEXTFIELD_HEIGHT;
    
    self.ipTextField.frame = CGRectMake(sideX, sideY, TEXTFIELD_WIDTH, TEXTFIELD_HEIGHT);
    sideY += 10+TEXTFIELD_HEIGHT;
    
    self.accountTextField.frame = CGRectMake(sideX, sideY, TEXTFIELD_WIDTH, TEXTFIELD_HEIGHT);
    sideY += 10+TEXTFIELD_HEIGHT;
    
    self.taxNumberTextField.frame = CGRectMake(sideX, sideY, TEXTFIELD_WIDTH, TEXTFIELD_HEIGHT);
    sideY += 10+TEXTFIELD_HEIGHT;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TextFields
- (HYTextFieldView *)emailTextField
{
    if (!_emailTextField) {
        _emailTextField = [HYTextFieldView defaultTextField:HY_Email];
    }
    return _emailTextField;
}

- (HYTextFieldView *)phoneTextField
{
    if (!_phoneTextField) {
        _phoneTextField = [HYTextFieldView defaultTextField:HY_Phone];
    }
    return _phoneTextField;
}

- (HYTextFieldView *)idcardTextField
{
    if (!_idcardTextField) {
        _idcardTextField = [HYTextFieldView defaultTextField:HY_IDCard];
    }
    return _idcardTextField;
}

- (HYTextFieldView *)ipTextField
{
    if (!_ipTextField) {
        _ipTextField = [HYTextFieldView defaultTextField:HY_IPAddress];
    }
    return _ipTextField;
}

- (HYTextFieldView *)accountTextField
{
    if (!_accountTextField) {
        _accountTextField = [HYTextFieldView defaultTextField:HY_Account];
    }
    return _accountTextField;
}

- (HYTextFieldView *)taxNumberTextField
{
    if (!_taxNumberTextField) {
        _taxNumberTextField = [HYTextFieldView defaultTextField:HY_TaxNumber];
    }
    return _taxNumberTextField;
}

#pragma mark - Notification Action
- (void)onTextFieldDidChanged:(NSNotification *)notification
{
    UITextField *textField = notification.object;
    if (![textField isKindOfClass:[UITextField class]]) {
        return;
    }
    
    if (![[textField superview] isKindOfClass:[HYTextFieldView class]]) {
        return;
    }
    
    HYTextFieldView *superView = (HYTextFieldView *)[textField superview];
    NSLog(@"%@",superView.text);
    
    switch (superView.type) {
        case HY_Email:
        {
            if ([superView.text isValidEmail]) {
                textField.layer.borderColor = [UIColor greenColor].CGColor;
            } else {
                textField.layer.borderColor = [UIColor redColor].CGColor;
            }
        }
            break;
            
        case HY_Phone:
        {
            if ([superView.text isValidPhoneNum]) {
                textField.layer.borderColor = [UIColor greenColor].CGColor;
            } else {
                textField.layer.borderColor = [UIColor redColor].CGColor;
            }
        }
            break;
            
        case HY_IDCard:
        {
            if ([superView.text isValidCarNo]) {
                textField.layer.borderColor = [UIColor greenColor].CGColor;
            } else {
                textField.layer.borderColor = [UIColor redColor].CGColor;
            }
        }
            break;
            
        case HY_IPAddress:
        {
            if ([superView.text isValidIP]) {
                textField.layer.borderColor = [UIColor greenColor].CGColor;
            } else {
                textField.layer.borderColor = [UIColor redColor].CGColor;
            }
        }
            break;
            
        case HY_Account:
        {
            if ([superView.text isValidChinese]) {
                textField.layer.borderColor = [UIColor greenColor].CGColor;
            } else {
                textField.layer.borderColor = [UIColor redColor].CGColor;
            }
        }
            break;
            
        case HY_TaxNumber:
        {
            if ([superView.text isValidTaxNo]) {
                textField.layer.borderColor = [UIColor greenColor].CGColor;
            } else {
                textField.layer.borderColor = [UIColor redColor].CGColor;
            }
        }
            break;
        default:
            break;
    }
    
}

@end
