//
//  TestManager.m
//  LovePets
//
//  Created by chenshaohai on 15/10/26.
//  Copyright (c) 2015年 zf. All rights reserved.
//

#import "TestManager.h"

@implementation TestManager
- (NSString *)methodName {
    return @"";//http://demo.dodokai.com/api.php
}
- (NSString *)serviceType {
    return  kAIFServiceLovePets;
}
- (RTAPIManagerRequestType)requestType {
    return RTAPIManagerRequestTypePost;
}
@end
