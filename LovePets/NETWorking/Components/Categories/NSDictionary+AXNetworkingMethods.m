//
//  NSDictionary+AXNetworkingMethods.m
//  RTNetworking
//
//  Created by casa on 14-5-6.
//  Copyright (c) 2014年 anjuke. All rights reserved.
//

#import "NSDictionary+AXNetworkingMethods.h"
#import "NSArray+AXNetworkingMethods.h"

@implementation NSDictionary (AXNetworkingMethods)

// 增加
- (NSString *)AIF_urlParamsStringSort {
    NSArray *sortedArray = [self AIF_transformedUrlParamsArraySignature:NO];
    return [sortedArray AX_ArrKeyValueString];
}

/** 字符串前面是没有问号的，如果用于POST，那就不用加问号，如果用于GET，就要加个问号 */
- (NSString *)AIF_urlParamsStringSignature:(BOOL)isForSignature
{
    NSArray *sortedArray = [self AIF_transformedUrlParamsArraySignature:isForSignature];
    return [sortedArray AX_paramsString];
}

/** 字典变json */
- (NSString *)AIF_jsonString
{
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:NULL];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

/** 转义参数 */
- (NSArray *)AIF_transformedUrlParamsArraySignature:(BOOL)isForSignature
{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        if (![obj isKindOfClass:[NSString class]]) {
            obj = [NSString stringWithFormat:@"%@", obj];
        }
        if (!isForSignature) {
            obj = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL,  (CFStringRef)obj,  NULL,  (CFStringRef)@"!*'();:@&;=+$,/?%#[]",  kCFStringEncodingUTF8));
        }
        if ([obj length] > 0) {
            [result addObject:[NSString stringWithFormat:@"%@=%@", key, obj]];
        }
    }];
    NSArray *sortedResult = [result sortedArrayUsingSelector:@selector(compare:)];
    return sortedResult;
}

/*
 NSString *jsonStr = [[model toRequestData] JSONString];
 NSDictionary *signDic = [model toDictionary];
 if (encrypt) {
 NSData *dataGBK = [jsonStr dataUsingEncoding:CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000)];
 jsonStr = [[XDJSecurityManager shareInstance] encryptByGBKRsa:dataGBK withKeyType:KeyTypePrivate];
 }
 
 NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
 NSArray *descriptors = [NSArray arrayWithObject:descriptor];
 NSArray *resultArray = [signDic.allKeys sortedArrayUsingDescriptors:descriptors];
 NSMutableArray *sortArray = [NSMutableArray array];
 for (NSString *sortString in resultArray) {
 NSDictionary *sortDictionary = @{sortString : [signDic objectForKey:sortString]};
 [sortArray addObject:sortDictionary];
 }
 NSString *signString = [[XDJSecurityManager shareInstance]getSignStringWithSortArray:sortArray];
 
 NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:signString, @"sign",
 @"1", @"merchantId",
 jsonStr, @"params", nil];
 [self toHttpPostWithURL:[NSString stringWithFormat:@"%@%@",[[XDJNetworkConfig shareConfig] currentSeverAddress],[model url]] withParams:params withResponseBlock:block];
 */

@end
