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

#pragma mark fangry0823: 16.2.22: 影响力接口更改
static NSString * const kAPIStatistics              = @"http://api.fromdtor.com/eye/graph/";

#pragma mark fangry0823: 16.2.22: 影响力--点击问号时要拦截的字符串由fake改为hint
static NSString * const kAPIStatisticsQuestion      = @"hint";

#pragma mark fangry0823: 16.2.22: 影响力--活跃粉丝字符串
static NSString * const kAPIActiveFansStr           = @"active";

#pragma mark fangry0823: 16.2.22: 影响力--低调粉丝字符串
static NSString * const kAPIInactiveFansStr         = @"inactive";



#pragma mark -
#pragma mark 分接口

#pragma mark fangry0823: 16.2.26: 检查版本更新接口 GET
static NSString * const kAPICheckUpdate             = @"/eye/check_update";

#pragma mark fangry0823: 16.1.12: 启动应用必定访问接口 GET
static NSString * const kAPIReady                   = @"/api/ready/";

#pragma mark ljy: 16.2.19: 活跃、低调粉丝数据请求URL GET
static NSString * const kAPIFans                    = @"/eye/fans/";

#pragma mark ljy: 16.2.25: 语音验证码请求URL GET
static NSString * const kAPIVoiceVerify             = @"/eye/voice_code/";

#pragma mark ljy: 16.2.25: 短信验证码请求URL GET
static NSString * const kAPIMessageVerify           = @"/eye/vcode/";

#pragma mark ljy: 16.2.25: 登录请求URL POST
static NSString * const kAPILogin                   = @"/eye/login/";

#pragma mark fangry0823: 16.3.3: 活动列别页面接口  GET
#pragma mark {girl_id: ddd, page: [可选，默认为1], page_size: [可选，默认为20], dedicated=0/1}
static NSString * const kAPISubjects                = @"/eye/subjects/";

#pragma mark fangry0823: 16.3.16: 活动活动详情页接口 GET
#pragma mark api: /eye/subject/<subject_id>/    参数{girl_id: ddd}
static NSString * const kAPISubject                 = @"/eye/subject/";

#pragma mark fangry0823: 16.3.17: 活动报名接口 POST
/**
 *  api: /eye/subject/<subject_id>/<girl_id>/
 *
 *  param: {girl_id: girl_id}
 *
 *  return:  {
 *              status: ddd, 0-报名成功
 *              msg: xxx
 *            }
 */
static NSString * const kAPISubjectPartake          = @"/eye/subject/";

#pragma mark fangry0823: 16.3.22: 活动报名人列表 GET
/**
 *    api: /eye/subject/<subject_id>/inset/
 *    method: GET
 *    参数: {page: 默认为1, page_size: 默认为20}
 *    rtv_fmt: {
 *        inset: [
 *            {
 *                avatar: xxx,
 *                name: xxx,
 *            },...
 *        ]
 *    }
 */
static NSString * const kAPISubjectGoPartakeGirl    = @"/eye/subject/%@/inset/";

#pragma mark ljy: 16.3.3: 个人中心的个人信息请求 GET
static NSString * const kAPIUserData                = @"/eye/base_info/";
#pragma mark ljy: 16.3.3: 个人中心的更新信息请求 GET
static NSString * const kAPINewsComingData          = @"/eye/badge/";
#pragma mark ljy: 16.3.3: 个人中心的福利列表请求 GET
static NSString * const kAPIBonusListData           = @"/eye/bonus/";

#pragma mark fangry0823 16.3.9 小助手接口
#pragma mark POST 发送消息 {girl_id: ddd, msg: xxx}  GET 获得消息 {page: [1默认值], page_size:[20默认值]}
static NSString * const kAPIChat                    = @"/eye/im/";

#pragma mark fangry0823 16.3.10 获取七牛Token 的接口 GET
static NSString * const kAPIQiniuToken              =  @"/api/upload_token/";

#pragma mark fangry0823 16.3.10 修改个人头像的接口 POST
static NSString * const kAPIPersonHeadImg           =  @"/eye/update_info/";

#endif
