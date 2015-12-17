//
//  TestType.h
//  LovePets
//
//  Created by chenshaohai on 15/10/28.
//  Copyright (c) 2015年 zf. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <>
//NS_ASSUME_NONNULL_BEGIN

@interface TestType  : NSObject
@property (strong, nonatomic) NSArray *imageArr;
//-(instancetype)init;
-(instancetype)initWithImage:(NSArray*)imageArr NS_DESIGNATED_INITIALIZER;
@end
//NS_ASSUME_NONNULL_END

