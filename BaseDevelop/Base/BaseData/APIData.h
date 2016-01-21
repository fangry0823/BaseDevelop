//
//  APIData.h
//  BaseDevelop
//
//  Created by 新锐 on 16/1/12.
//
//

#ifndef APIData_h
#define APIData_h

/**
 *  存放API的接口
 */


#pragma mark -
#pragma mark 服务器主地址


#if OnLineService
static NSString * const kServerAddress = @"http://123.57.238.227";
#else
static NSString * const kServerAddress = @"http://182.92.242.101";
#endif


#pragma mark -
#pragma mark 分接口

#pragma mark 16.1.12 海选PK界面 GET
static NSString * const kAPITrayoutPK = @"/api/tryout/";

#pragma mark 16.1.12 登陆接口 POST
static NSString * const kAPILogin = @"/api/login/";

#pragma mark 16.1.14 启动应用必定访问接口 GET
static NSString * const kAPIReady = @"/api/ready/";

#pragma mark 16.1.18 动态页列表
static NSString * const kAPIDyanmicList = @"/api/headline/";

#pragma mark 16.1.18 摇一摇
static NSString * const kAPIShake = @"/api/shuffle/";

#endif
