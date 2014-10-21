//
//  Util.h
//  LocalMap
//
//  Created by 郭远强 on 14-10-21.
//  Copyright (c) 2014年 郭远强. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AssetsLibrary/AssetsLibrary.h>

#ifdef DEBUG
#define LOG(...) NSLog(__VA_ARGS__);
#define LOG_METHOD NSLog(@"%@", __func__);
#else
#define LOG(...);
#define LOG_METHOD;
#endif

#define IS_IPHONE_5 ( ( UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone ) && ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON ) )

#define IS_IOS_7 (([[[[UIDevice currentDevice].systemVersion componentsSeparatedByString:@"."] objectAtIndex:0] intValue] >= 7) ? YES : NO)

#define IS_IOS_8 (([[[[UIDevice currentDevice].systemVersion componentsSeparatedByString:@"."] objectAtIndex:0] intValue] >= 8) ? YES : NO)

#define IS_IOS_5 (([[[[UIDevice currentDevice].systemVersion componentsSeparatedByString:@"."] objectAtIndex:0] intValue] < 6) ? YES : NO)

#define IS_CHINESE  [Util isChinese]

#define  DeviceType_iPad               @"iPad"
#define  DeviceType_iPhone             @"iPhone"
#define  DeviceType_iPod               @"iPod"
#define  POSTNAME                      @"POSTNAME"
#define  POSTDIC                       @"POSTDIC"
#define  BarItemWidth                  50
#define  BarItemHeight                 30

#define TICK   NSDate *startTime = [NSDate date]
#define TOCK   NSLog(@"Time: %f", -[startTime timeIntervalSinceNow])

@interface Util : NSObject

+ (NSUInteger) DeviceSystemMajorVersion;
+ (BOOL) isIPhone;
+ (BOOL) isIPad;
+ (BOOL) isIPod;
+ (BOOL) isIpadRetina;
+ (BOOL) isChinese;

@end


