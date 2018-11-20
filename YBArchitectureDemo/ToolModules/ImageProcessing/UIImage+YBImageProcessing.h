//
//  UIImage+YBImageProcessing.h
//  YBArchitectureDemo
//
//  Created by 杨波 on 2018/11/19.
//  Copyright © 2018 杨波. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (YBImageProcessing)

/**
 根据颜色生成图片

 @param color 颜色
 @return --
 */
+ (UIImage *)yb_imageWithColor:(UIColor *)color;

/**
 根据颜色生成图片

 @param color 颜色
 @param rect 大小
 @return --
 */
+ (UIImage *)yb_imageWithColor:(UIColor *)color rect:(CGRect)rect;

@end

NS_ASSUME_NONNULL_END
