//
//  UIImage+YBImageProcessing.m
//  YBArchitectureDemo
//
//  Created by 杨波 on 2018/11/19.
//  Copyright © 2018 杨波. All rights reserved.
//

#import "UIImage+YBImageProcessing.h"

@implementation UIImage (YBImageProcessing)

+ (UIImage *)yb_imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    return [self yb_imageWithColor:color rect:rect];
}

+ (UIImage *)yb_imageWithColor:(UIColor *)color rect:(CGRect)rect {
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end
