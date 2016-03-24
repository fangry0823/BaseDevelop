//
//  DataController.h
//  XiaoHuaJiaDao_TSGS
//
//  Created by 新锐 on 16/2/1.
//  Copyright © 2016年 XR. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^DataCallback)(NSDictionary *dic);
typedef void(^NoneDataCallback)();
typedef void(^NetWorkFaildCallback)();

@interface DataController : NSObject

@property (nonatomic, copy, readonly) DataCallback callback;
@property (nonatomic, copy, readonly) NoneDataCallback noneDataCallback;
@property (nonatomic, copy, readonly) NetWorkFaildCallback netWorkFaildCallback;

- (void)dataCallback:(DataCallback)dataCallback noneData:(NoneDataCallback)noneDataCallback netWorkFaild:(NetWorkFaildCallback)netWorkFaildCallback;

@end
