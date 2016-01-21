//
//  FrequentlyUsedData.h
//  BaseDevelop
//
//  Created by 新锐 on 16/1/12.
//
//

#ifndef FrequentlyUsedData_h
#define FrequentlyUsedData_h

/**
 *  存放方便使用的数据
 */


#pragma mark -
#pragma mark 一些key值

#pragma mark 1.1.1 缓存
static NSString * const kStatrsCache            = @"55c17537e0f55a4bb7004d7c";



#pragma mark -
#pragma mark 提示信息

static NSString * const kNetNotWork             = @"网络情况不好,请稍候重试!";


#pragma mark -
#pragma mark 加载请求

typedef NS_ENUM(NSInteger, RefreshData) {
    RefreshHeaderHasMoreData = 0,//下拉有更多数据
    RefreshHeaderNoMoreData,  //下拉没有更多数据
    RefreshFooterHasMoreData,    //上拉有更多数据
    RefreshRooterNoMoreData,  //上拉没有更多数据
    RefreshError                 //刷新出错
};


#endif
