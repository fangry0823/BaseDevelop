//
//  ScreenScale.h
//  BaseDevelop
//
//  Created by 新锐 on 16/1/15.
//
//

#import <Foundation/Foundation.h>


/**
 *  全屏幕状态以iPhone5为基准的比例因子
 *  不要在代码中更改
 */
extern CGFloat kScale;

/**
 *  以iPhone5为基准的比例因子
 *  全屏幕状态下宽
 *  不要在代码中更改
 */
extern CGFloat kScaleW;

/**
 *  以iPhone5为基准的比例因子
 *  全屏幕状态下高
 *  不要在代码中更改
 */
extern CGFloat kScaleH;

/**
 *  以iPhone5为基准的比例因子
 *  有导航栏状态下宽
 *  不要在代码中更改
 */
extern CGFloat kNScaleW;

/**
 *  以iPhone5为基准的比例因子
 *  有导航栏状态下高
 *  不要在代码中更改
 */
extern CGFloat kNScaleH;


@interface ScreenScale : NSObject

@end
