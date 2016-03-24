//
//  UserModel.h
//  XiaoHuaJiaDao_TSGS
//
//  Created by 新锐 on 16/1/28.
//  Copyright © 2016年 XR. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UserUniversityModel;
@class UserDepartmentModel;

typedef enum {
    Male,
    Female
}Gender;

@interface UserModel : NSObject

@property (nonatomic, assign) NSUInteger id;
@property (nonatomic, copy)   NSString *name;
@property (nonatomic, copy)   NSString *avatar;
@property (nonatomic, copy)   NSString *school;

+ (instancetype)shared;
@end

#pragma mark -
#pragma mark 学校
@interface UserUniversityModel : NSObject

@property (nonatomic, assign) NSUInteger id;
@property (nonatomic, copy)   NSString *name;
@property (nonatomic, strong) UserDepartmentModel *department;
@end

#pragma mark -
#pragma mark 学院
@interface UserDepartmentModel : NSObject

@property (nonatomic, assign) NSUInteger id;
@property (nonatomic, copy)   NSString *name;
@end
