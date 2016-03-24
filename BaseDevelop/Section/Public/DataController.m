//
//  DataController.m
//  XiaoHuaJiaDao_TSGS
//
//  Created by 新锐 on 16/2/1.
//  Copyright © 2016年 XR. All rights reserved.
//

#import "DataController.h"

@implementation DataController {
    void(^dataCall)(NSDictionary *dic);
    void(^noneDataCall)();
    void(^netWorkFaildCall)();
}

- (void)dataCallback:(DataCallback)dataCallback noneData:(NoneDataCallback)noneDataCallback netWorkFaild:(NetWorkFaildCallback)netWorkFaildCallback {
    dataCall = dataCallback;
    noneDataCall = noneDataCallback;
    netWorkFaildCall = netWorkFaildCallback;
}

- (DataCallback)callback {
    return dataCall;
}

- (NoneDataCallback)noneDataCallback {
    return noneDataCall;
}

- (NetWorkFaildCallback)netWorkFaildCallback {
    return netWorkFaildCall;
}

@end
