//
//  ViewController.m
//  HYStringRegex
//
//  Created by 恒阳 on 16/8/3.
//  Copyright © 2016年 恒阳. All rights reserved.
//

#import "ViewController.h"
#import "NSString+HYRegex.h"
#import "NSString+JSON.h"
#import "KeyboardManager.h"

#import "HYContentView.h"
#import "HYTextFieldView.h"

#import "YYModel.h"
#import "AFNetworking.h"

#import "Book.h"

#import "DownloadModel.h"

@interface ViewController ()<UITextFieldDelegate>
@property (nonatomic , strong) HYContentView   *contentView;
@property (nonatomic , strong) HYTextFieldView *emailTextField;
@property (nonatomic , strong) HYTextFieldView *phoneTextField;
@property (nonatomic , strong) HYTextFieldView *ipTextField;
@property (nonatomic , strong) HYTextFieldView *urlTextField;
@property (nonatomic , strong) HYTextFieldView *idcardTextField;
@property (nonatomic , strong) HYTextFieldView *accountTextField;
@property (nonatomic , strong) HYTextFieldView *chineseTextField;
@property (nonatomic , strong) HYTextFieldView *postCardTextField;
@property (nonatomic , strong) HYTextFieldView *taxNumberTextField;
@end

@implementation ViewController
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"字符串校验";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.contentView];
    
    [self.contentView addModule:self.emailTextField];
    [self.contentView addModule:self.phoneTextField];
    [self.contentView addModule:self.ipTextField];
    [self.contentView addModule:self.urlTextField];
    [self.contentView addModule:self.idcardTextField];
    [self.contentView addModule:self.accountTextField];
    [self.contentView addModule:self.chineseTextField];
    [self.contentView addModule:self.postCardTextField];
    [self.contentView addModule:self.taxNumberTextField];
    
    // notificationSender传递nil，告知观察者接收所有对象的UITextFieldTextDidChangeNotification
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
    
    self.contentView.frame = CGRectMake(0, 10, self.view.frame.size.width, self.view.frame.size.height-10);
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // AFNetWorking Test
    NSURL *url = [NSURL URLWithString:@"https://g.alicdn.com/trip/template-style/0.0.220/HotelListStyle.json"];
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
        } else {
            NSLog(@"%@ %@", response, responseObject);
            if (responseObject && [responseObject isKindOfClass:[NSDictionary class]]) {
                
            }
        }
    }];
    [dataTask resume];
    
    // YYModel Test
    
    // 第一步：json数据转换为dictionary，方法1是jsonString->jsonObject；方法2是json文件->jsonObject
    // 法1
    NSDictionary *dict = [@"\{\"n\":\"Harry Pottery\",\"p\":256,\"ext\":{\"desc\":\"A book written by J.K.Rowing.\"},\"ID\":100010}" jsonObject];
    // 法2
    NSString *path = [[NSBundle mainBundle] pathForResource:@"book.json" ofType:@""];
    NSData *jsonData = [NSData dataWithContentsOfFile:path];
    id jsonObj = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    NSLog(@"%@",jsonObj);
    
    // 第二步：Test YYModel
    // 字典类型转换为模型对象
    Book *book = [Book yy_modelWithDictionary:dict];
    // 模型对象转换为字典数据
    NSDictionary *bookDic = [book yy_modelToJSONObject];
    NSLog(@"%@",bookDic);
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    DownloadModel *downloadModel = [[DownloadModel alloc] init];
    [downloadModel start];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TextFields
- (HYContentView *)contentView
{
    if (!_contentView) {
        _contentView = [[HYContentView alloc] initWithFrame:CGRectZero];
    }
    return _contentView;
}

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

- (HYTextFieldView *)urlTextField
{
    if (!_urlTextField) {
        _urlTextField = [HYTextFieldView defaultTextField:HY_URL];
    }
    return _urlTextField;
}

- (HYTextFieldView *)accountTextField
{
    if (!_accountTextField) {
        _accountTextField = [HYTextFieldView defaultTextField:HY_Account];
    }
    return _accountTextField;
}

- (HYTextFieldView *)chineseTextField
{
    if (!_chineseTextField) {
        _chineseTextField = [HYTextFieldView defaultTextField:HY_URL];
    }
    return _chineseTextField;
}

- (HYTextFieldView *)postCardTextField
{
    if (!_postCardTextField) {
        _postCardTextField = [HYTextFieldView defaultTextField:HY_URL];
    }
    return _postCardTextField;
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
            if ([superView.text isValidIdCardNum]) {
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
            
        case HY_URL:
        {
            if ([superView.text isValidUrl]) {
                textField.layer.borderColor = [UIColor greenColor].CGColor;
            } else {
                textField.layer.borderColor = [UIColor redColor].CGColor;
            }
        }
            break;
            
        case HY_Account:
        {
            if ([superView.text isValidWithMinLenth:4 maxLenth:12 containChinese:NO firstCannotBeDigtal:YES]) {
                textField.layer.borderColor = [UIColor greenColor].CGColor;
            } else {
                textField.layer.borderColor = [UIColor redColor].CGColor;
            }
        }
            break;
            
        case HY_Chinese:
        {
            if ([superView.text isValidChinese]) {
                textField.layer.borderColor = [UIColor greenColor].CGColor;
            } else {
                textField.layer.borderColor = [UIColor redColor].CGColor;
            }
        }
            break;
            
        case HY_Postalcode:
        {
            if ([superView.text isValidPostalcode]) {
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
