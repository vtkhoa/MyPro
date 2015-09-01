//
//  UIView+Extra.h
//  ViecLamTayTrai
//
//  Created by AuNguyen on 4/15/15.
//  Copyright (c) 2015 BSP Software Services Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface UIView (Extra)

- (void)setLayerCornerRadius:(CGFloat)cornerRadiu;
- (void)setLayerBorderColor:(UIColor *)color;
- (void)setLayerBorderWidth:(CGFloat)width;
- (CAGradientLayer *) gradientWithTopColor:(UIColor *)topColor bottomColor:(UIColor *)bottomColor;
- (void)addLineAtBottomViewWithContentView:(UIView *)view borderWidth:(float)width color:(UIColor *)color;
- (void)addLineAtPositionWithContentView:(UIView *)view position_Y:(float)positionY borderWidth:(float)width color:(UIColor *)color;
- (UIView *)loadViewWithUIView:(UIView *)view;
- (UIView *)roundCornersOnView:(UIView *)view onTopLeft:(BOOL)tl topRight:(BOOL)tr bottomLeft:(BOOL)bl bottomRight:(BOOL)br radius:(float)radius;

@end
