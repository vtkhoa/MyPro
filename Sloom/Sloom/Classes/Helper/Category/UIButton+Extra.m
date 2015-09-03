//
//  UIButton+Extra.m
//  ViecLamTayTrai
//
//  Created by Cuong Voong Tan Quoc on 5/15/15.
//  Copyright (c) 2015 BSP Software Services Corporation. All rights reserved.
//

#import "UIButton+Extra.h"

@implementation UIButton (Extra)


-(void)setLayerBorderWidth:(CGFloat)width borderColor:(UIColor *)color cornerRadius:(CGFloat)cornerRadius
{
    self.layer.borderWidth = width;
    self.layer.borderColor = color.CGColor;
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
}


@end
