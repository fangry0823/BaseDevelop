//
//  UserModel.m
//  XiaoHuaJiaDao_TSGS
//
//  Created by 新锐 on 16/1/28.
//  Copyright © 2016年 XR. All rights reserved.
//

#import "UserModel.h"

static UserModel *userInfo = nil;

@implementation UserModel

+ (instancetype)shared{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        userInfo = [[self alloc] init];
    });
    NSDictionary * userDic = [[NSUserDefaults standardUserDefaults] objectForKey:kUserInfo];
    [userInfo mj_setKeyValues:userDic];
    
    return userInfo;
}
@end

@implementation UserUniversityModel

@end

@implementation UserDepartmentModel

@end

