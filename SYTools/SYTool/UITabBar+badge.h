//
//  UITabBar+badge.h
//  FunDanceStudent
//
//  Created by 龙青磊 on 2019/2/14.
//  Copyright © 2019 龙青磊. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITabBar (badge)

- (void)showBadgeOnItemIndex:(int)index;
- (void)hideBadgeOnItemIndex:(int)index;

@end

NS_ASSUME_NONNULL_END
