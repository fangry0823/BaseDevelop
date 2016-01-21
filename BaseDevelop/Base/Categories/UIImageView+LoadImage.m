//
//  UIImageView+LoadImage.m
//  BaseDevelop
//
//  Created by 新锐 on 16/1/12.
//
//

#import "UIImageView+LoadImage.h"

@implementation UIImageView (LoadImage)

- (void)setImageWithURLStr:(NSString *)urlStr placeholderImage:(UIImage *)image {
    urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:urlStr];
    [self sd_setImageWithURL:url placeholderImage:image options:SDWebImageRetryFailed];
}

- (void)setImageLoadAnimationWithURLStr:(NSString *)urlStr placeholderImage:(UIImage *)image {
    urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:urlStr];
    [self sd_setImageWithURL:url placeholderImage:image options:SDWebImageRetryFailed completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (cacheType == SDImageCacheTypeNone) {
            self.alpha = 0;
            [UIView animateWithDuration:0.5 animations:^{
                self.alpha = 1;
            }];
        }
    }];
}

+ (void)downloadImageWithURL:(NSString *)urlStr completed:(SDWebImageCompletionWithFinishedBlock)completedBlock{
    urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:urlStr];
    [[SDWebImageManager sharedManager] downloadImageWithURL:url options:SDWebImageRetryFailed progress:nil completed:completedBlock];
}

@end
