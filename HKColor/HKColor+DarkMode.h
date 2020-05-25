//
//  HKColor+DarkMode.h
//  YXDoctor
//
//  Created by mac on 2020/3/19.
//  Copyright © 2020 msun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIColor+HKColor.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (DarkMode)

/***
   （ 16进制色值 #000000 ）
    darkColor： 暗黑模式色值
    color： 正常模式色值
 */
+(UIColor *)colorWithDarColor:(NSString *)darkColor normalColor:(NSString *)color;

@end

NS_ASSUME_NONNULL_END
