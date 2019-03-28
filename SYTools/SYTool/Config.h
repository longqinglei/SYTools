//
//  Config.h
//  SYTools
//
//  Created by 龙青磊 on 2019/3/28.
//  Copyright © 2019 龙青磊. All rights reserved.
//

#ifndef Config_h
#define Config_h

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "Tool.h"
#import "NSAttributedString+LineSpacing.h"
#import "UIColor+HexColor.h"
#import "UIDevice+category.h"
#import "UIFont+FitSize.h"
#import "UIResponder+tools.h"
#import "UITabBar+badge.h"

//设备
#define isIPhoneX ((int)((kScreenHeight/kScreenWidth)*100) == 216)?YES:NO
#define isIPhone5 [UIScreen mainScreen].bounds.size.height==568
#define isIPhone6 [UIScreen mainScreen].bounds.size.height==667
#define isPlus    [UIScreen mainScreen].bounds.size.height==736

//系统版本
#define Version9     [[[UIDevice currentDevice] systemVersion] doubleValue] >= 9.0
#define Version10    [[[UIDevice currentDevice] systemVersion] doubleValue] >= 10.0
#define Version11    [[[UIDevice currentDevice] systemVersion] doubleValue] >= 11.0
#define Version12    [[[UIDevice currentDevice] systemVersion] doubleValue] >= 12.0

//设备的宽和高
#define  ScreenHeight   [UIScreen mainScreen].bounds.size.height
#define  ScreenWidth    [UIScreen mainScreen].bounds.size.width

#define  kScreenWidth    ((ScreenWidth > ScreenHeight) ? (ScreenHeight) : (ScreenWidth))
#define  kScreenHeight   ((ScreenWidth > ScreenHeight) ? (ScreenWidth) : (ScreenHeight))

//nav高
#define kNavHegith      ((isIPhoneX) ? 88 : 64)
//tabar高
#define kTabbarHeight   ((isIPhoneX) ? 83 : 49)
//tabar底部安全区域d高度
#define kTabbarBottom   ((isIPhoneX) ? 34 : 0)

#define kTopSafeAreaHeight ((isIPhoneX) ? 44 : 20)

//颜色值
#define RGB(r,g,b)      RGB_A(r,g,b,1)
#define RGB_A(r,g,b,a)  [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

//弱引用
#define KWeakSelf(type) __weak typeof(type) weak##type = type;

//相对375数值

#define Width(value) ((kScreenWidth) / 375) * value
#define WidthH(value) ((kScreenWidth) / 375) * value

//打印log具体位置
#define NSLog(format, ...)   {\
(NSLog)((format), ##__VA_ARGS__);                                           \
fprintf(stderr, "log location--->");                                      \
fprintf(stderr, "<%s : %d> %s\n",                                           \
[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String],  \
__LINE__, __func__);                                                        \
fprintf(stderr, "\n");                                               \
}


typedef void(^RequestFinish)(BOOL result, id data);



#endif /* Config_h */
