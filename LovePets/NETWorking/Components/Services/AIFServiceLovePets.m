//
//  AIFServiceLovePets.m
//  LovePets
//
//  Created by chenshaohai on 15/10/26.
//  Copyright (c) 2015年 zf. All rights reserved.
//

#import "AIFServiceLovePets.h"

@implementation AIFServiceLovePets

#pragma mark - AIFServiceProtocal
- (BOOL)isOnline
{
    return YES;
}

- (NSString *)onlineApiBaseUrl
{
//    return @"http://demo.dodokai.com/api.php";
    return @"http://192.168.1.151:8030/H5Phone";
}

- (NSString *)onlineApiVersion
{
    return @"directions/json";
}

- (NSString *)onlinePrivateKey
{
    return @"";
}

- (NSString *)onlinePublicKey
{
    return @"9636464a87f7e8503c6456c3fb53e103";
}

- (NSString *)offlineApiBaseUrl
{
    return self.onlineApiBaseUrl;
}

- (NSString *)offlineApiVersion
{
    return self.onlineApiVersion;
}

- (NSString *)offlinePrivateKey
{
    return self.onlinePrivateKey;
}

- (NSString *)offlinePublicKey
{
    return self.onlinePublicKey;
}
@end
