//
//  Util.m
//  LocalMap
//
//  Created by 郭远强 on 14-10-21.
//  Copyright (c) 2014年 郭远强. All rights reserved.
//

#import "Util.h"
#include <sys/types.h>
#include <sys/sysctl.h>
#include <sys/socket.h>
#include <net/if.h>
#include <net/if_dl.h>
#include <sys/types.h>
#include <sys/sysctl.h>
#include <mach/machine.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>


@interface Util (PrivateFunction)
+ (NSString *)platform;
@end

@implementation Util

+ (NSUInteger) DeviceSystemMajorVersion
{
    static NSUInteger _deviceSystemMajorVersion = -1;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _deviceSystemMajorVersion = [[[[[UIDevice currentDevice] systemVersion] componentsSeparatedByString:@"."] objectAtIndex:0] intValue];
    });
    return _deviceSystemMajorVersion;
}

+ (BOOL)isIPad {
    NSString *deviceType = [UIDevice currentDevice].model;
//    NSLog(@"current DeviceType = %@", deviceType);
    NSRange range = [deviceType rangeOfString:DeviceType_iPad];
    return range.location != NSNotFound;
}

+ (BOOL)isIPhone {
    NSString *deviceType = [UIDevice currentDevice].model;
//    NSLog(@"current DeviceType = %@", deviceType);
    NSRange range = [deviceType rangeOfString:DeviceType_iPhone];
    return range.location != NSNotFound;
}

+ (BOOL)isIPod {
    NSString *deviceType = [UIDevice currentDevice].model;
//    NSLog(@"current DeviceType = %@", deviceType);
    NSRange range = [deviceType rangeOfString:DeviceType_iPod];
    return range.location != NSNotFound;
}

+ (BOOL)isIpadRetina
{
    static BOOL _isIpadRetina = YES;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *platform = [Util platform];
        NSRange range = [platform rangeOfString:@","];

        if (range.location != NSNotFound) {
            range.length = 1;
            range.location = range.location - 1;
            NSString *type = [platform substringWithRange:range];
            if ([type integerValue] < 3) {
                _isIpadRetina = [type integerValue] < 3 ? NO : YES;
            }
        }

        
    });
    return _isIpadRetina;

}

+ (BOOL)isChinese
{
    static BOOL _isChinese = NO;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSString *langua = [[NSLocale preferredLanguages] firstObject];
        if ([langua isEqualToString:@"zh-Hans"] || [langua isEqualToString:@"zh-Hant"] ) {
            _isChinese = YES;
        }
        
    });
    return _isChinese;
    
}

@end
