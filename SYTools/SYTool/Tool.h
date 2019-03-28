//
//  Tool.h
//  SYTools
//
//  Created by 龙青磊 on 2019/3/26.
//  Copyright © 2019 龙青磊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Tool : NSObject

/**
 根据storyboard和storyboardid 返回控制器

 @param storyboard storyboard名称
 @param viewcontroller controller所在storyboard的storyboardid
 @return 返回的控制器
 */
+ (UIViewController *)storyboard:(NSString *)storyboard viewcontroller:(NSString *)viewcontroller;


/**
 把data转成对象

 @param object data数据
 @return 转换完成的对象
 */
+ (id)dataToJson:(NSData *)object;

/**
 把对象转换成json字符串

 @param object 要转换的对象
 @return 转换完成的字符串
 */
+ (NSString *)objectToJsondString:(id)object;


/**
 把对象转成data

 @param object 要被转的对象
 @return 转换完成的data
 */
+ (NSData *)objectToJsonData:(id)object;

/**
 获取当前显示的控制器

 @return 返回当前显示的控制器
 */
+ (UIViewController *)getCurrentVC;


/**
 返回一张指定颜色的图片

 @param color 指定的颜色
 @return 返回的图片
 */
+ (UIImage *)createImageWithColor:(UIColor *)color;

/**
 根据时间戳获取日期字符串

 @param interval 时间戳
 @param format 日期格式(默认 yyyy-MM-dd HH:mm:ss)
 @return 日期字符串
 */
+ (NSString *)getDateStrWithNSTimeInterval:(NSInteger)interval format:(NSString *)format;



/**
 判断电话号码是否合法

 @param mobile 电话号码
 @return 返回结果
 */
+ (BOOL)checkMobileWithMobileNumber:(NSString *)mobile;


/**
 拨打电话

 @param mobile 电话号码
 */
//+ (void)callMobileWithMobileNumber:(NSString *)mobile;


/**
 字符串32位小写加密

 @param str 要加密的字符串
 @return 加密完成的字符串
 */
+ (NSString *)MD5ForLower32Bate:(NSString *)str;

/**
 字符串32位大写加密

 @param str 要加密的字符串
 @return 加密完成的字符串
 */
+(NSString *)MD5ForUpper32Bate:(NSString *)str;


/**
 根据日期字符串获取某日的凌晨时间戳(如果不传参数 默认返回当天的时间戳)

 @return 返回时间戳
 */
+ (NSInteger)getTodayTimestampWithDateStr:(NSString *)dateString;


/**
 获取文本高度

 @param str 字符串
 @param font 字体
 @param width 宽度
 @param linespacing 行间距
 @return 高度
 */
+ (CGFloat)getLabelHeight:(NSString*)str withFont:(UIFont*)font withWidth:(CGFloat)width lineSpacing:(CGFloat)linespacing;

/**
 把字典转化成json字符串

 @param object 要转化的对象
 @return 转化完成的字符串
 */
+ (NSString *)getStringWithObject:(id)object;


/**
 把json字符串转成对象

 @param jsonString jsonstr
 @return 对象
 */
+ (id)getObjectWithJosnStr:(NSString *)jsonString;


/**
 获取版本号

 @return 版本号
 */
+ (NSString *)getVersionCode;



@end

NS_ASSUME_NONNULL_END
