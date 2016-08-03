//
//  HYTextFieldView.h
//  HYStringRegex
//
//  Created by 恒阳 on 16/8/3.
//  Copyright © 2016年 恒阳. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    HY_Email=0,
    HY_Phone,
    HY_IDCard,
    HY_IPAddress,
    HY_URL,
    HY_Account,
    HY_Chinese,
    HY_Postalcode,
    HY_TaxNumber,
} HYTextFieldViewType;

@interface HYTextFieldView : UIView
+ (HYTextFieldView *)defaultTextField:(HYTextFieldViewType)type;
@property (nonatomic , readonly , assign) HYTextFieldViewType type;
@property (nonatomic , readonly , strong) NSString *text;
@end
