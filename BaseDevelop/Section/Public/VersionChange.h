//
//  VersionChange.h
//  XiaoHuaJiaDao_TSGS
//
//  Created by 新锐 on 16/2/26.
//  Copyright © 2016年 XR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VersionChange : NSObject 

+ (VersionChange *)shared;
- (void)change;

@end
