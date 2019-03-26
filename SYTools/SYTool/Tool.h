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

@end

NS_ASSUME_NONNULL_END
