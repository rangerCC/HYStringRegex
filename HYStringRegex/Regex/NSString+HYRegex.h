//
//  NSString+HYRegex.h
//  HYStringRegex
//
//  Created by 恒阳 on 16/8/3.
//  Copyright © 2016年 恒阳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (HYRegex)
- (BOOL)isValidEmail;
- (BOOL)isValidPhoneNum;
- (BOOL)isValidCarNo;
- (BOOL)isValidUrl;
- (BOOL)isValidPostalcode;
- (BOOL)isValidChinese;
- (BOOL)isValidIP;
- (BOOL)isValidIdCardNum;
- (BOOL)isValidTaxNo;

- (BOOL)isValidWithMinLenth:(NSInteger)minLenth
                   maxLenth:(NSInteger)maxLenth
             containChinese:(BOOL)containChinese
        firstCannotBeDigtal:(BOOL)firstCannotBeDigtal;

- (BOOL)isValidWithMinLenth:(NSInteger)minLenth
                   maxLenth:(NSInteger)maxLenth
             containChinese:(BOOL)containChinese
              containDigtal:(BOOL)containDigtal
              containLetter:(BOOL)containLetter
      containOtherCharacter:(NSString *)containOtherCharacter
        firstCannotBeDigtal:(BOOL)firstCannotBeDigtal;
@end
