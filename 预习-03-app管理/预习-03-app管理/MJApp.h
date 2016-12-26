//
//  MJApp.h
//  预习-03-app管理
//
//  Created by MJ Lee on 14-4-3.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MJApp : NSObject
/**
 图标
 */
@property (copy, nonatomic) NSString *icon;
/**
 名称
 */
@property (copy, nonatomic) NSString *name;
/**
 大小
 */
@property (copy, nonatomic) NSString *size;
/**
 下载量
 */
@property (copy, nonatomic) NSString *download;

@property (assign, nonatomic, getter = isDownloaded) BOOL downloaded;

+ (instancetype)appWithDict:(NSDictionary *)dict;
- (instancetype)initWithDict:(NSDictionary *)dict;
@end
