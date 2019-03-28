//
//  NSAttributedString+LineSpacing.h
//  FunDanceStudent
//
//  Created by 龙青磊 on 2018/12/10.
//  Copyright © 2018 龙青磊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIFont+FitSize.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSAttributedString (LineSpacing)

+ (NSAttributedString *)getLineSpacingStringWithString:(NSString *)string linespacing:(NSInteger)linesparing font:(UIFont *)font;

@end

NS_ASSUME_NONNULL_END
