//
//  UIImage+alpha.h
//  Component
//
//  Created by Chance on 15/7/14.
//  Copyright (c) 2015年 济南掌游. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (details)

/**
 base64解码
 
 @param string base64编码的流字符串
 
 */
+ (UIImage *)imageWithBase64String:(NSString *)string;

/**
 *  改变UIImage颜色（必须为纯色）
 */
- (UIImage *)imageWithTintColor:(UIColor *)tintColor;

- (UIImage *)imageByApplyingAlpha:(CGFloat) alpha;

/**
 *  改变image的方向（拍照之后）
 */
+ (UIImage *)fixOrientation:(UIImage *)aImage;

/**
 *  图片压缩
 *
 *  @param sourceImage 图片
 *  @param defineWidth 压缩宽度
 *
 */
+ (UIImage *) imageCompressForWidth:(UIImage *)sourceImage targetWidth:(CGFloat)defineWidth;

/*
 * @brief rotate image 90 withClockWise
 */
- (UIImage*)rotate90Clockwise;

/*
 * @brief rotate image 90 counterClockwise
 */
- (UIImage*)rotate90CounterClockwise;

/*
 * @brief rotate image 180 degree
 */
- (UIImage*)rotate180;

/*
 * @brief rotate image to default orientation
 */
- (UIImage*)rotateImageToOrientationUp;

/*
 * @brief flip horizontal
 */
- (UIImage*)flipHorizontal;

/*
 * @brief flip vertical
 */
- (UIImage*)flipVertical;

/*
 * @brief flip horizontal and vertical
 */
- (UIImage*)flipAll;

/**
 生成颜色图片
 
 @param color 颜色
 @param height 高度
 @return 图片
 */
- (UIImage*) imageWithColor:(UIColor*)color andHeight:(CGFloat)height;

/**
 返回一张不超过屏幕大小的图片

 @param image <#image description#>
 @return <#return value description#>
 */
+ (UIImage *)imageSizeWithScreenImage:(UIImage *)image;

@end
