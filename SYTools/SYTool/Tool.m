//
//  Tool.m
//  SYTools
//
//  Created by 龙青磊 on 2019/3/26.
//  Copyright © 2019 龙青磊. All rights reserved.
//

#import "Tool.h"

@implementation Tool

// 返回SB中的控制器
+ (UIViewController *)storyboard:(NSString *)storyboard viewcontroller:(NSString *)viewcontroller{
    NSAssert(storyboard && viewcontroller, @"(EZTool) +storyboard:viewcontroller param is error");
    UIViewController *page = nil;
    UIStoryboard *story = [UIStoryboard storyboardWithName:storyboard bundle:nil];
    if (story) {
        page = [story instantiateViewControllerWithIdentifier:viewcontroller];
    }
    return page;
}

// 把data转为对象
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


// 把对象转为json字符串
+ (NSString *)objectToJsondString:(id)object{
    NSString *jsonString = nil;
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:&error];
    if (! jsonData) {
        NSLog(@"Got an error: %@", error);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    return jsonString;
}

//把对象转换成data
+ (NSData *)objectToJsonData:(id)object{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:&error];
    if (jsonData) {
        return jsonData;
    }else{
        return nil;
    }
}



//获取当前屏幕显示的控制器
+ (UIViewController *)getCurrentVC{
    UIViewController *result = nil;
    UIWindow * window = [[UIApplication sharedApplication].delegate window];
    if (window.windowLevel != UIWindowLevelNormal){
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    return result;
}

@end
