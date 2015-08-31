//
//  UIButton+Extra.m
//  ViecLamTayTrai
//
//  Created by Cuong Voong Tan Quoc on 5/15/15.
//  Copyright (c) 2015 BSP Software Services Corporation. All rights reserved.
//

#import "UIButton+Extra.h"

@implementation UIButton (Extra)

- (void)setLayerCornerRadius:(CGFloat)cornerRadius {
    self.layer.cornerRadius = cornerRadius;
}

-(void)setLayerBorderColor:(UIColor *)color
{
    self.layer.borderColor = color.CGColor;
}

-(void)setLayerBorderWidth:(CGFloat)width
{
    self.layer.borderWidth = width;
}


@end
