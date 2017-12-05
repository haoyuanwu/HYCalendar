//
//  NSDate+HYDate.h
//  HYDate + stretch
//
//  Created by wuhaoyuan on 16/4/21.
//  Copyright © 2016年 HYDate. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (HYDate)

/**
 *  字符串转时间 StringWithDate
 */
+ (NSDate *)stringWithDate:(NSString *)string Formatter:(NSString *)formatter;

/**
 *  第二天日期 TodayTime
 */
+ (NSDate *)toDayDate;

/**
 *  后某天的日期 SomedayTime
 *
 *  @param index 当天的第几天  dayNnumber
 *
 *  @return
 */
+ (NSDate *)dayDateformIndex:(NSInteger)index;

/**
 *  时间转字符串 dateWithString
 */
- (NSString *)string;

/**
 *  时间转字符串
 *
 *  @param formatterStr 类型 dateType
 *
 *  @return 
 */
- (NSString *)stringWithFormatter:(NSString *)formatterStr;

/**
 *  年
 */
- (NSString *)yearString;
/**
 *  月
 */
- (NSString *)monthString;
/**
 *  日
 */
- (NSString *)dayString;

/**
 计算时间点之前的天数时间
 
 @param day  天数
 @param date 时间点
 
 @return
 */
+ (NSTimeInterval)ComputationTimeDay:(id)day date:(NSDate *)date;

@end
