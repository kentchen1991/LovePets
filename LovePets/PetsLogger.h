//
//  PetsLogger.h
//  LovePets
//
//  Created by chenshaohai on 15/9/30.
//  Copyright (c) 2015年 zf. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(UInt8,  LPLogLevel) {
    LPLogLevelDEBUG         = 1,
    LPLogLevelINFO          = 2,
    LPLogLevelWARN          = 3,
    LPLogLevelERROR         = 4,
    LPLogLevelOFF           = 5,
};


#define LP_LOG_MACRO(level, fmt, ...)     [[PetsLogger sharedInstance] logLevel:level format:(fmt), ##__VA_ARGS__]
#define LP_LOG_PRETTY(level, fmt, ...)    \
do {LP_LOG_MACRO(level, @"%s #%d " fmt, __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);} while(0)

#define LPLogError(frmt, ...)   LP_LOG_PRETTY(LPLogLevelERROR, frmt, ##__VA_ARGS__)
#define LPLogWarn(frmt, ...)    LP_LOG_PRETTY(LPLogLevelWARN,  frmt, ##__VA_ARGS__)
#define LPLogInfo(frmt, ...)    LP_LOG_PRETTY(LPLogLevelINFO,  frmt, ##__VA_ARGS__)
#define LPLogDebug(frmt, ...)   LP_LOG_PRETTY(LPLogLevelDEBUG, frmt, ##__VA_ARGS__)
//#define DLog(frmt, ...) LP_LOG_PRETTY(LPLogLevelDEBUG, frmt, ##__VA_ARGS__)

@interface PetsLogger : NSObject

@property (nonatomic, assign)  LPLogLevel logLevel;

+ (instancetype)sharedInstance;
//+ (void)startWithLogLevel:(LPLogLevel)logLevel;
- (void)logLevel:(LPLogLevel)level format:(NSString *)format, ...;
- (void)logLevel:(LPLogLevel)level message:(NSString *)message;

@end
