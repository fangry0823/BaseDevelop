//
//  CGUtilities.h
//  BaseDevelop
//
//  Created by 新锐 on 16/3/23.
//
//

#import <Foundation/Foundation.h>


/**
 *  全屏幕状态以iPhone5为基准的缩放因子
 */
CGFloat scaling();

/**
 *  以iPhone5为基准的缩放因子
 *  全屏幕状态下宽
 */
CGFloat scalingW();

/**
 *  以iPhone5为基准的缩放因子
 *  全屏幕状态下高
 */
CGFloat scalingH();

/**
 *  以iPhone5为基准的缩放因子
 *  有导航栏状态下宽
 */
CGFloat navScalingW();

/**
 *  以iPhone5为基准的缩放因子
 *  有导航栏状态下高
 */
CGFloat navScalingH();

/**
 *  系统屏幕 scale
 */
CGFloat screenScale();

/**
 *  屏幕的尺寸
 */
CGSize screenSize();

