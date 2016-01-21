//
//  TooltipBox.h
//  BaseDevelop
//
//  Created by 新锐 on 16/1/14.
//
//

#import <Foundation/Foundation.h>

@interface TooltipBox : NSObject

/**
 *  根据statues内容显示普通弹窗,自动消失
 */
extern void ShowMessage(NSString *statues);

/**
 *  根据statues内容显示成功弹窗,自动消失
 */
extern void ShowSuccessStatus(NSString *statues);

/**
 *  根据statues内容显示错误弹窗,自动消失
 */
extern void ShowErrorStatus(NSString *statues);

/**
 *  根据statues内容显示正在加载弹窗,不自动消失
 */
extern void ShowLoadingStatus(NSString *statues);

/**
 *  根据progress显示进度弹窗,不自动消失
 */
extern void ShowProgress(CGFloat progress);

/**
 *  根据progress和statues显示进度弹窗,不自动消失
 */
extern void ShowProgressStatus(CGFloat progress, NSString *statues);

/**
 *  取消显示弹窗
 */
extern void DismissHud(void);


@end
