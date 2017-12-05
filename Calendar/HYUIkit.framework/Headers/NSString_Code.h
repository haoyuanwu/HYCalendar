//
//  NSString_Code.h
//  HYUIkit
//
//  Created by iPhone on 15/11/17.
//  Copyright © 2015年 wuhaoyuan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//#import <CommonCrypto/CommonCryptor.h>
//#import <CommonCrypto/CommonDigest.h>
#import "GTMBase64.h"

@interface NSString_Code : NSString

/**
 解析中文的手字谜

 @param string 文字
 @return 首字母
 */
+ (NSString *)chineseExchangePinyin:(NSString *)string;
/**
 *  判断是不是手机号
 */
+ (BOOL)isMobile:(NSString *)mobileNumbel;

/**
 *  自定义正则表达式判断
 *
 *  @param regex 正则表达式
 */
- (BOOL)isJudge:(NSString *)regex;

/**
 *  验证身份证格式
 */
- (BOOL)isUserIDCard;

/**
 *  验证纯数字
 */
- (BOOL)isNumber;

/**
 *  验证数字和字母
 */
- (BOOL)isASIICode;

/**
 *  验证邮箱格式
 */
- (BOOL)isEmailCode;

/**
 *  判断是不是空
 */
- (NSString *)isExist;

/**
 *  自适应高度
 *
 *  @param width 宽度
 *  @param font  字体大戏
 *
 *  @return
 */
- (CGFloat)textHeight:(CGFloat)width font:(UIFont *)font;

/*!
 
 * @brief 把格式化的JSON格式的字符串转换成字典
 
 * @param jsonString JSON格式的字符串
 
 * @return 返回字典
 
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
/**
 *  字典转成json字符串
 *
 *  @param dic 字典
 *
 *  @return string
 */
+ (NSString*)dictionaryToJsonString:(id)obj;

/**
 字符串MD5加密
 
 @param str 字符串
 */
//- (NSString *)md5;

/**
 3DES加密和解密
 
 @param plainText        加密字符串
 @param encryptOrDecrypt 0 加密 1 解密
 @param key              加密的可key
 
 @return
 */
//+ (NSString*)TripleDES:(NSString*)plainText encryptOrDecrypt:(CCOperation)encryptOrDecrypt key:(NSString*)key;
@end

