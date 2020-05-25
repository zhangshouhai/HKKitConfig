//
//  HKColor+DarkMode.m
//  YXDoctor
//
//  Created by mac on 2020/3/19.
//  Copyright © 2020 msun. All rights reserved.
//

#import "HKColor+DarkMode.h"

@implementation UIColor (DarkMode)


+(UIColor *)colorWithDarColor:(NSString *)darkColor normalColor:(NSString *)color
{
    if (@available(iOS 13.0,*)) {
        UIColor *dyColor = [UIColor colorWithDynamicProvider:^UIColor * _Nonnull(UITraitCollection * _Nonnull trainCollection) {
            if ([trainCollection userInterfaceStyle] == UIUserInterfaceStyleDark) {
                return [UIColor colorWithHexString:darkColor alpha:1];
            }
            else {
                return [UIColor colorWithHexString:color alpha:1];
            }
        }];
        return dyColor;
    }
    return [UIColor colorWithHexString:color alpha:1];
}


@end
