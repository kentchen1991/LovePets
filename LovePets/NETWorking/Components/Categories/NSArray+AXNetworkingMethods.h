//
//  NSArray+AXNetworkingMethods.h
//  RTNetworking
//
//  Created by casa on 14-5-13.
//  Copyright (c) 2014年 anjuke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (AXNetworkingMethods)

- (NSString *)AX_paramsString;
- (NSString *)AX_jsonString;
//增加 新增
- (NSString *)AX_ArrKeyValueString;
@end
