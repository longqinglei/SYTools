//
//  Tool.h
//  SYTools
//
//  Created by 龙青磊 on 2019/3/26.
//  Copyright © 2019 龙青磊. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Tool : NSObject

/**
 把data转成对象

 @param object data数据
 @return 转换完成的对象
 */
+ (id)dataToJson:(NSData *)object;

@end

NS_ASSUME_NONNULL_END
