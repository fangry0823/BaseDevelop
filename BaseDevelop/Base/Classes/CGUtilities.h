//
//  CGUtilities.h
//  BaseDevelop
//
//  Created by 新锐 on 16/3/23.
//
//

#import <Foundation/Foundation.h>


/**
 *  全屏幕状态以iPhone5为基准的比例因子
 */
CGFloat ratio();

/**
 *  以iPhone5为基准的比例因子
 *  全屏幕状态下宽
 */
CGFloat ratioW();

/**
 *  以iPhone5为基准的比例因子
 *  全屏幕状态下高
 */
CGFloat ratioH();

/**
 *  以iPhone5为基准的比例因子
 *  有导航栏状态下宽
 */
CGFloat navRatioW();

/**
 *  以iPhone5为基准的比例因子
 *  有导航栏状态下高
 */
CGFloat navRatioH();

/**
 *  系统屏幕 scale
 */
CGFloat screenScale();

/**
 *  屏幕的尺寸
 */
CGSize screenSize();

