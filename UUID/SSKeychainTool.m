//
//  SSKeychainTool.m
//  yootnn
//
//  Created by apple on 17/3/16.
//  Copyright © 2016年 I can. All rights reserved.
//

#import "SSKeychainTool.h"
#import "SSKeychain.h"

@implementation SSKeychainTool

/**
 *  生成UUID
 */
+ (NSString *)creatUUID {
    CFUUIDRef uuid = CFUUIDCreate(NULL);
    assert(uuid != NULL);
    CFStringRef uuidStr = CFUUIDCreateString(NULL, uuid);
    NSString * result = (NSString *)CFBridgingRelease(CFStringCreateCopy( NULL, uuidStr));
    CFRelease(uuid);
    CFRelease(uuidStr);
    return result;
}


/**
 *  保存UUID
 */
+ (BOOL)saveWithUUID:(NSString *)uuid {
    [[NSUserDefaults standardUserDefaults] setObject:uuid forKey:DeviceUID];
    [[NSUserDefaults standardUserDefaults] synchronize];
    return [SSKeychain setPassword:uuid forService:Identifier account:Account];
}



/**
 *  生成和保存UUID
 */
+ (BOOL)creatAndSaveUUID {
    return [SSKeychainTool creatAndSaveUUIDWithService:Identifier account:Account];
}



/**
 *  生成和保存UUID
 *
 *  @param service serviceName
 *  @param account account
 *
 *  @return 结果
 */
+ (BOOL)creatAndSaveUUIDWithService:(NSString *)service account:(NSString *)account {
    CFUUIDRef uuid = CFUUIDCreate(NULL);
    assert(uuid != NULL);
    CFStringRef uuidStr = CFUUIDCreateString(NULL, uuid);
    NSString * result = (NSString *)CFBridgingRelease(CFStringCreateCopy( NULL, uuidStr));
    CFRelease(uuid);
    CFRelease(uuidStr);
    
    return [SSKeychain setPassword:result forService:service account:account];
    
}

/**
 *  读取UUID
 *
 *  @return UUID
 */
+ (NSString *)readUUID {
     return  [SSKeychainTool readUUIDWithService:Identifier account:Account];
}


/**
 *  读取UUID
 *
 *  @param service serviceName
 *  @param account account
 *
 *  @return 删除结果
 */
+ (NSString *)readUUIDWithService:(NSString *)service account:(NSString *)account {
     return  [SSKeychain passwordForService:service account:account];
}

/**
 *  删除UUID
 *
 *  @param service serviceName
 *  @param account account
 *
 *  @return 删除结果
 */
+ (BOOL)deleteUUIDWithService:(NSString *)service account:(NSString *)account {
    return [SSKeychain deletePasswordForService:service account:account];
}

/**
 *  删除UUID
 *  @return 删除结果
 */
+ (BOOL)deleteUUID {
    return [SSKeychainTool deleteUUIDWithService:Identifier account:Account];
}



@end
