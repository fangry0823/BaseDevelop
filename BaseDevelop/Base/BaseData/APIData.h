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

#if DEBUG
static BOOL const kIsProduction        = false;
static NSString * const kServerAddress = @"http://test.fromdtor.com"; ///< 测试用地址
#else
static BOOL const kIsProduction        = true;
static NSString * const kServerAddress = @"http://api.fromdtor.com";  ///< 正式用地址
#endif


#pragma mark -
#pragma mark WebViwe地址



#pragma mark -
#pragma mark 分接口

/**
 *    api: /eye/check_update/
 *    method: GET
 *    参数：{}
 *    rtv_fmt: {version: xxx, link: xxx}
 */
#pragma mark fangry0823: 16.2.26: 检查版本更新接口 GET
static NSString * const kAPICheckUpdate             = @"/eye/check_update";

/**
 *    api: /api/upload_token/
 *    method: GET
 *    rtv_fmt: {'uptoken': xxx}
 */
#pragma mark fangry0823 16.3.10 获取七牛Token 的接口 GET
static NSString * const kAPIQiniuToken              =  @"/api/upload_token/";


#endif
