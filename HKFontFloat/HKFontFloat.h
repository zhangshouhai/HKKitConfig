//
//  HKFontFloat.h
//  YXDoctor
//
//  Created by mac on 2020/4/27.
//  Copyright © 2020 msun. All rights reserved.
//
#import <UIKit/UIKit.h>

#ifndef HKFontFloat_h
#define HKFontFloat_h



CG_INLINE CGFloat HKFontFlaot(CGFloat height) {
    

    NSString *deviceType = [UIDevice currentDevice].model;
    
    BOOL isPad ;
    if([deviceType isEqualToString:@"iPhone"]) {
        //iPhone
        isPad =  NO;
    }
    else if([deviceType isEqualToString:@"iPod touch"]) {
        //iPod Touch
        isPad =  NO;
    }
    else if([deviceType isEqualToString:@"iPad"]) {
        //iPad
        isPad =  YES;
    }
    else
    {
        isPad =  NO;
    }
    
    if(!isPad)
    {
        return height;
    }
    else
    {
        height = height * 1.5;
        return height;
    }
    
    
    
}


#endif /* HKFontFloat_h */
