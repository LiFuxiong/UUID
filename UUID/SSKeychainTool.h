//
//  SSKeychainTool.h
//  yootnn
//
//  Created by apple on 17/3/16.
//  Copyright © 2016年 I can. All rights reserved.
//

#import <Foundation/Foundation.h>

#define DeviceUID @"deviceUID"
#define Account @"User"
#define Identifier [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"]
@interface SSKeychainTool : NSObject


/**
 *  生成UUID
 */
+ (NSString *)creatUUID;


/**
 *  保存UUID
 */
+ (BOOL)saveWithUUID:(NSString *)uuid;



/**
 *  生成和保存UUID
 */
+ (BOOL)creatAndSaveUUID;



/**
 *  生成和保存UUID
 *
 *  @param service serviceName
 *  @param account account
 *
 *  @return 结果
 */
+ (BOOL)creatAndSaveUUIDWithService:(NSString *)service account:(NSString *)account;

/**
 *  读取UUID
 *
 *  @return UUID
 */
+ (NSString *)readUUID;


/**
 *  读取UUID
 *
 *  @param service serviceName
 *  @param account account
 *
 *  @return 删除结果
 */
+ (NSString *)readUUIDWithService:(NSString *)service account:(NSString *)account;

/**
 *  删除UUID
 *
 *  @param service serviceName
 *  @param account account
 *
 *  @return 删除结果
 */
+ (BOOL)deleteUUIDWithService:(NSString *)service account:(NSString *)account;

/**
 *  删除UUID
 *  @return 删除结果
 */
+ (BOOL)deleteUUID;


@end
