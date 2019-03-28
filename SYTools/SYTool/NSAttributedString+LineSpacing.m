//
//  NSAttributedString+LineSpacing.m
//  FunDanceStudent
//
//  Created by 龙青磊 on 2018/12/10.
//  Copyright © 2018 龙青磊. All rights reserved.
//

#import "NSAttributedString+LineSpacing.h"

@implementation NSAttributedString (LineSpacing)

+ (NSAttributedString *)getLineSpacingStringWithString:(NSString *)string linespacing:(NSInteger)linesparing font:(UIFont *)font{
    NSString *content = string;
    if (content == nil) {
        content = @"";
    }
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = linesparing;
    NSDictionary * attributes = @{
                                  NSFontAttributeName:font,
                                  NSParagraphStyleAttributeName:paragraphStyle
                                  };
    return [[NSAttributedString alloc] initWithString:content attributes:attributes];
}

@end
