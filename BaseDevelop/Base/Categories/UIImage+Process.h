//
//  UIImage+Process.h
//  BaseDevelop
//
//  Created by 新锐 on 16/1/15.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (Process)

/**
 *  图片等比例压缩
 *
 *  @param  asize 目标尺寸
 *
 *  @return 返回
 */
- (UIImage *)imageToThumbnailScaleImageWihtSize:(CGSize)asize;

/**
 *  创建一个图片image
 *
 *  @param color图片的颜色
 *  @param size图片的尺寸
 *
 *  @return 根据颜色和尺寸创建的新图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;


@end
