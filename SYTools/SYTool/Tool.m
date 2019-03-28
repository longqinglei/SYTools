//
//  Tool.m
//  SYTools
//
//  Created by 龙青磊 on 2019/3/26.
//  Copyright © 2019 龙青磊. All rights reserved.
//

#import "Tool.h"
#import <CommonCrypto/CommonDigest.h>

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


// 返回一张指定颜色的图片
+ (UIImage *)createImageWithColor:(UIColor *)color{
    CGRect rect = CGRectMake(0.0f, 0.0f, 50, 50);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}


// 根据时间戳获取日期字符串
+ (NSString *)getDateStrWithNSTimeInterval:(NSInteger)interval format:(NSString *)format{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    if (format) {
        [formatter setDateFormat:format];
    }else{
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    }
    NSString *time = [formatter stringFromDate:date];
    return time;
}


//判断电话号码是否合法
+ (BOOL)checkMobileWithMobileNumber:(NSString *)mobile{
    NSString *regex = @"1[3-9][0-9]\\d{8}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES  %@", regex];
    BOOL isvalid = [predicate evaluateWithObject:mobile];
    if (isvalid) {
        return YES;
    }else{
        return NO;
    }
}


////拨打电话
//+ (void)callMobileWithMobileNumber:(NSString *)mobile{
//    NSMutableString *str = [[NSMutableString alloc] initWithFormat:@"tel:%@",mobile];
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str] options:@{} completionHandler:nil];
//}


+ (NSString *)MD5ForLower32Bate:(NSString *)str{
    //要进行UTF8的转码
    const char* input = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);
    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02x", result[i]];
    }
    return digest;
}

//md5加密
+(NSString *)MD5ForUpper32Bate:(NSString *)str{
    //要进行UTF8的转码
    const char* input = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);

    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02X", result[i]];
    }
    return digest;
}


//获取当日的凌晨时间戳
+ (NSInteger)getTodayTimestampWithDateStr:(NSString *)dateString;{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *datestr = [formatter stringFromDate:[NSDate date]];
    NSDate *date = [formatter dateFromString:datestr];
    if (dateString) {
        date = [formatter dateFromString:dateString];
    }
    NSInteger time = [date timeIntervalSince1970];
    return time;
}


//获取文本高度
+ (CGFloat)getLabelHeight:(NSString*)str withFont:(UIFont*)font withWidth:(CGFloat)width lineSpacing:(CGFloat)linespacing{
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    if (linespacing) {
        paraStyle.lineSpacing = linespacing;
    }
    //    paraStyle.hyphenationFactor = 1.0;
    //    paraStyle.firstLineHeadIndent = 0.0;
    //    paraStyle.paragraphSpacingBefore = 0.0;
    //    paraStyle.headIndent = 0;
    //    paraStyle.tailIndent = 0;
    //, NSKernAttributeName:@1.5f
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle
                          };
    CGSize size = [str boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options: NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
    return  ceilf(size.height);
}


//把对象转成josn字符串
+ (NSString *)getStringWithObject:(id)object{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString;
    if (!jsonData) {
        NSLog(@"%@",error);
    }else{
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    NSRange range = {0,jsonString.length};
    //去掉字符串中的空格
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    NSRange range2 = {0,mutStr.length};
    //去掉字符串中的换行符
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    return mutStr;
}

//把字符串转成对象
+ (id)getObjectWithJosnStr:(NSString *)jsonString{
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err){
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}


+ (NSString *)getVersionCode{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    //    NSString *app_build = [infoDictionary objectForKey:@"CFBundleVersion"];
    return [NSString stringWithFormat:@"%@",version];
}

@end
