//
//  UIView+Extra.m
//  ViecLamTayTrai
//
//  Created by AuNguyen on 4/15/15.
//  Copyright (c) 2015 BSP Software Services Corporation. All rights reserved.
//

#import "UIView+Extra.h"

@implementation UIView (Extra)

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

-(CAGradientLayer *) gradientWithTopColor:(UIColor *)topColor bottomColor:(UIColor *)bottomColor
{
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.bounds;
    gradient.colors = [NSArray arrayWithObjects:(id)[topColor CGColor], (id)[bottomColor CGColor], nil];
    
    return gradient;
}

-(void)addLineAtBottomViewWithContentView:(UIView *)view borderWidth:(float)width color:(UIColor *)color
{
    UIView *viewLine = [[UIView alloc] initWithFrame:CGRectMake(0, view.frame.size.height-width, view.frame.size.width, width)];
    viewLine.backgroundColor = color;
    
    [view addSubview:viewLine];
}

-(void)addLineAtPositionWithContentView:(UIView *)view position_Y:(float)positionY borderWidth:(float)width color:(UIColor *)color
{
    UIView *viewLine = [[UIView alloc] initWithFrame:CGRectMake(0, positionY, view.frame.size.width, width)];
    viewLine.backgroundColor = color;
    
    [view addSubview:viewLine];
}

-(UIView *)loadViewWithUIView:(UIView *)view
{
    view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, DEVICE_SIZE.width, DEVICE_SIZE.height)];
    view.backgroundColor = kUIViewBackgroundWhiteColor;
    view.layer.zPosition = 1;
    [LHJLoaderView setOnView:view withTitle:@"Loading..." animated:YES];

    return view;
}

-(UIView *)roundCornersOnView:(UIView *)view onTopLeft:(BOOL)tl topRight:(BOOL)tr bottomLeft:(BOOL)bl bottomRight:(BOOL)br radius:(float)radius
{
    if (tl || tr || bl || br) {
        UIRectCorner corner = 0; //holds the corner
        //Determine which corner(s) should be changed
        if (tl) {
            corner = corner | UIRectCornerTopLeft;
        }
        if (tr) {
            corner = corner | UIRectCornerTopRight;
        }
        if (bl) {
            corner = corner | UIRectCornerBottomLeft;
        }
        if (br) {
            corner = corner | UIRectCornerBottomRight;
        }
        
        UIView *roundedView = view;
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:roundedView.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(radius, radius)];
        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        maskLayer.frame = roundedView.bounds;
        maskLayer.path = maskPath.CGPath;
        roundedView.layer.mask = maskLayer;
        return roundedView;
    } else {
        return view;
    }
    
}

@end
