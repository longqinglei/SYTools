//
//  UIDevice+category.m
//  TeacherGoDancing
//
//  Created by Kevin on 2019/1/28.
//  Copyright © 2019 Kevin. All rights reserved.
//

#import "UIDevice+category.h"

@implementation UIDevice (category)
+ (void)switchNewOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    
    NSNumber *resetOrientationTarget = [NSNumber numberWithInt:UIInterfaceOrientationUnknown];
    
    [[UIDevice currentDevice] setValue:resetOrientationTarget forKey:@"orientation"];
    
    NSNumber *orientationTarget = [NSNumber numberWithInt:interfaceOrientation];
    
    [[UIDevice currentDevice] setValue:orientationTarget forKey:@"orientation"];
    
}
@end
