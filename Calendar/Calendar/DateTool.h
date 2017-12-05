//
//  DateTool.h
//  Calendar
//
//  Created by 吴昊原 on 2017/9/30.
//  Copyright © 2017年 吴昊原. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateTool : NSObject

///根据用户输入的时间(dateString)确定当天是星期几,输入的时间格式 yyyy-MM-dd ,如 2015-12-18
+ (NSString *)getTheDayOfTheWeekByDateString:(NSString *)dateString;
@end
