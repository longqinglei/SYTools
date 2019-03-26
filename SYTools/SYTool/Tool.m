//
//  Tool.m
//  SYTools
//
//  Created by 龙青磊 on 2019/3/26.
//  Copyright © 2019 龙青磊. All rights reserved.
//

#import "Tool.h"

@implementation Tool

// 把JSON转为字典
+ (id)dataToJson:(NSData *)object{
    id result;
    NSError *error = nil;
    if (object) {
        result = [NSJSONSerialization JSONObjectWithData:object
                                                 options:NSJSONReadingMutableContainers
                                                   error:&error];
    }
    return error ? error : result;
}


@end
