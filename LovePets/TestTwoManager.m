//
//  TestTwoManager.m
//  LovePets
//
//  Created by chenshaohai on 15/10/27.
//  Copyright (c) 2015年 zf. All rights reserved.
//

#import "TestTwoManager.h"

@implementation TestTwoManager

- (NSString *)methodName {
    return @"/admin/friend/getFriendInfo";//http://demo.dodokai.com/api.php
}
- (NSString *)serviceType {
    return  kAIFServiceLovePets;
}
- (RTAPIManagerRequestType)requestType {
    return RTAPIManagerRequestTypePost;
}
@end
