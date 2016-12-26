//
//  MJApp.m
//  预习-03-app管理
//
//  Created by MJ Lee on 14-4-3.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJApp.h"

@implementation MJApp
+ (instancetype)appWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
@end
