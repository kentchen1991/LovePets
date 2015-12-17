//
//  PetsLogger.m
//  LovePets
//
//  Created by chenshaohai on 15/9/30.
//  Copyright (c) 2015年 zf. All rights reserved.
//

#import "PetsLogger.h"

@implementation PetsLogger
+ (void)load
{
#ifdef DEBUG
    fprintf( stderr, "****************************************************************************************\n" );
    fprintf( stderr, "    											   \n" );
    fprintf( stderr, "    	copyright (c) 2015, {LOVEPETS}               \n" );
    fprintf( stderr, "    	https://git.sn.com                         \n" );
    fprintf( stderr, "    										       \n" );
    
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
    
//    fprintf( stderr, "    	%s %s	\n", [SystemInfo platformString].UTF8String, [SystemInfo osVersion].UTF8String );
//    fprintf( stderr, "    	ip: %s	\n", [SystemInfo localIPAddress].UTF8String );
    fprintf( stderr, "    	Home: %s	\n", [NSBundle mainBundle].bundlePath.UTF8String );
    fprintf( stderr, " \n" );
    fprintf( stderr, "    		 sandybox:%s",NSHomeDirectory().UTF8String);
    fprintf( stderr, "****************************************************************************************\n" );
#endif
    
#endif
}

+ (instancetype)sharedInstance
{
    static PetsLogger *_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[PetsLogger alloc] init];
    });
    return _instance;
}

//+ (void)startWithLogLevel:(SNLogLevel)logLevel
//{
//    [self sharedInstance];
//    [[self sharedInstance] setLogLevel:logLevel];
//}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        // sends log statements to Xcode console - if available
//        [[DDTTYLogger sharedInstance] setLogFormatter:self];
//        [DDLog addLogger:[DDTTYLogger sharedInstance]];
//        
//        // sends log statements to Apple System Logger, so they show up on Console.app
//        [[DDASLLogger sharedInstance] setLogFormatter:self];
//        [DDLog addLogger:[DDASLLogger sharedInstance]];
//        
//        //文件输出
//        //        DDFileLogger *fileLogger = [[DDFileLogger alloc] init];
//        //        fileLogger.rollingFrequency = 60 * 60 * 24; // 24 hour rolling
//        //        fileLogger.logFileManager.maximumNumberOfLogFiles = 7;
//        //        [fileLogger setLogFormatter:self];
//        //        [DDLog addLogger:fileLogger];
//        
//        // And then enable colors
//        char *xcode_colors = getenv("XcodeColors");
//        if (xcode_colors && (strcmp(xcode_colors, "YES") == 0))
//        {
//            [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
//            [[DDTTYLogger sharedInstance] setForegroundColor:RGBCOLOR(0, 0, 255)
//                                             backgroundColor:nil
//                                                     forFlag:LOG_FLAG_INFO];
//            [[DDTTYLogger sharedInstance] setForegroundColor:RGBCOLOR(0, 0, 0)
//                                             backgroundColor:nil
//                                                     forFlag:LOG_FLAG_DEBUG];
//        }
    }
    return self;
}

//- (NSString *)formatLogMessage:(DDLogMessage *)logMessage
//{
//    NSString *logLevel = nil;
//    switch (logMessage->logFlag)
//    {
//        case LOG_FLAG_ERROR:
//            logLevel = @"[ERROR] > ";
//            break;
//        case LOG_FLAG_WARN:
//            logLevel = @"[WARN]  > ";
//            break;
//        case LOG_FLAG_INFO:
//            logLevel = @"[INFO]  > ";
//            break;
//        case LOG_FLAG_DEBUG:
//            logLevel = @"[DEBUG] > ";
//            break;
//        default:
//            logLevel = @"[VBOSE] > ";
//            break;
//    }
//    
//    NSString *formatStr = [NSString stringWithFormat:@"%@%@",
//                           logLevel, logMessage->logMsg];
//    return formatStr;
//}

//- (void)setLogLevel:(LPLogLevel)logLevel
//{
//    _logLevel = logLevel;
//    switch (_logLevel) {
//        case SNLogLevelDEBUG:
//            ddLogLevel = LOG_LEVEL_DEBUG;
//            break;
//        case SNLogLevelINFO:
//            ddLogLevel = LOG_LEVEL_INFO;
//            break;
//        case SNLogLevelWARN:
//            ddLogLevel = LOG_LEVEL_WARN;
//            break;
//        case SNLogLevelERROR:
//            ddLogLevel = LOG_LEVEL_ERROR;
//            break;
//        case SNLogLevelOFF:
//            ddLogLevel = LOG_LEVEL_OFF;
//            break;
//        default:
//            break;
//    }
//}

//! 记录日志(有格式)
- (void)logLevel:(LPLogLevel)level format:(NSString *)format, ...
{
    if (format)
    {
        va_list args;
        va_start(args, format);
        NSString *message = [[NSString alloc] initWithFormat:format arguments:args];
        va_end(args);
        [self logLevel:level message:message];
    }
}

//! 记录日志(无格式)
- (void)logLevel:(LPLogLevel)level message:(NSString *)message
{
    if (message.length > 0)
    {
        switch (level)
        {
            case LPLogLevelERROR:
//                DDLogError(@"%@", message);
                NSLog(@"LPLogLevelERROR:%@",message);
                break;
                
            case LPLogLevelWARN:
//                DDLogWarn(@"%@", message);
                NSLog(@"LPLogLevelWARN:%@",message);
                break;
                
            case LPLogLevelINFO:
//                DDLogInfo(@"%@", message);
                NSLog(@"LPLogLevelINFO:%@",message);
                break;
                
            case LPLogLevelDEBUG:
//                DDLogDebug(@"%@", message);
                NSLog(@"LPLogLevelDEBUG:%@",message);
                break;
                
            default:
//                DDLogVerbose(@"%@", message);
                NSLog(@"DDLogVerbose:%@",message);
                break;
        }
    }
}
@end
