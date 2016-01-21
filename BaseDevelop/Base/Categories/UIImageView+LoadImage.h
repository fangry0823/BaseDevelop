//
//  UIImageView+LoadImage.h
//  BaseDevelop
//
//  Created by 新锐 on 16/1/12.
//
//

#import <UIKit/UIKit.h>
#import <UIImageView+WebCache.h>

@interface UIImageView (LoadImage)

/**
 *  根据地址给ImageView加载图片
 *
 *  @param urlStr   图片的地址
 *  @param image    没有加载完成前的默认图片
 *
 *  @return nil
 */
- (void)setImageWithURLStr:(NSString *)urlStr placeholderImage:(UIImage *)image;

/**
 *  根据地址给ImageView加载图片下载完会有渐显的过程
 *
 *  @param urlStr   图片的地址
 *  @param image    没有加载完成前的默认图片
 *
 *  @return nil
 */
- (void)setImageLoadAnimationWithURLStr:(NSString *)urlStr placeholderImage:(UIImage *)image;

/**
 *  根据地址下载图片
 *
 *  @param urlStr   图片的地址
 *  @param SDWebImageCompletionWithFinishedBlock    下载完图片的信息，有SDWebImage提供
 *
 */
+ (void)downloadImageWithURL:(NSString *)urlStr completed:(SDWebImageCompletionWithFinishedBlock)completedBlock;

@end
