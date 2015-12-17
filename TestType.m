//
//  TestType.m
//  LovePets
//
//  Created by chenshaohai on 15/10/28.
//  Copyright (c) 2015年 zf. All rights reserved.
//



#import "TestType.h"
//#define STRINGIFY(S) #S
//#define DEFER_STRINGIFY(S) STRINGIFY(S)
//#define PRAGMA_MESSAGE(MSG) _Pragma(STRINGIFY(message(MSG)))
//#define FORMATTED_MESSAGE(MSG) "[TODO-" DEFER_STRINGIFY(__COUNTER__) "] " MSG " \n" \
//DEFER_STRINGIFY(__FILE__) " line " DEFER_STRINGIFY(__LINE__)
//#define KEYWORDIFY try {} @catch (...) {}
//// 最终使用下面的宏
//#define TODO(MSG) KEYWORDIFY PRAGMA_MESSAGE(FORMATTED_MESSAGE(MSG))
@implementation TestType
//- (instancetype)init
//{
//    self = [self initWithImage:@[]];
//    if (self) {
////        NSArray *strings = @[@"sun", @"yuan"];
////        NSDictionary *mapping = @{@"a": @1, @"b": @2};
//    }
//    return self;
//}

-(instancetype)initWithImage:(NSArray*)imageArr {
    if (self =[super init]) {

    }
    return self;
}
@end
