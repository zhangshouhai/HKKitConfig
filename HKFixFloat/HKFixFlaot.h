//
//  HKFixFlaot.h
//  YXDoctor
//
//  Created by mac on 2020/3/27.
//  Copyright © 2020 msun. All rights reserved.
//


#import <UIKit/UIKit.h>

#ifndef HKFixFlaot_h
#define HKFixFlaot_h


CG_INLINE CGFloat HKFixHWFlaot(CGFloat height) {
    
    
    
    
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
        CGRect mainFrme = [[UIScreen mainScreen] bounds];
        CGFloat width  =  mainFrme.size.width/375.0;
        height = height * width;
        return height;
    }
    else
    {
        CGRect mainFrme = [[UIScreen mainScreen] bounds];
        CGFloat width  =  mainFrme.size.width/768.0;
        height = height * 1.3;
        return height;
    }
    
    
    
}


#endif /* HKFixFlaot_h */

