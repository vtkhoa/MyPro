//
//  NSLayoutManager+Extra.m
//  ViecLamTayTrai
//
//  Created by Nguyen Quang Vu on 6/19/15.
//  Copyright (c) 2015 BSP Software Services Corporation. All rights reserved.
//

#import "NSLayoutManager+Extra.h"

@implementation NSLayoutManager_Extra
- (void)fillBackgroundRectArray:(const CGRect *)rectArray count:(NSUInteger)rectCount forCharacterRange:(NSRange)charRange color:(UIColor *)color
{
    CGFloat halfLineWidth = 4.; // change this to change corners radius
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    if (rectCount == 1
        || (rectCount == 2 && (CGRectGetMaxX(rectArray[1]) < CGRectGetMinX(rectArray[0])))
        )
    {
        // 1 rect or 2 rects without edges in contact
        
        CGPathAddRect(path, NULL, CGRectInset(rectArray[0], halfLineWidth, halfLineWidth));
        if (rectCount == 2)
            CGPathAddRect(path, NULL, CGRectInset(rectArray[1], halfLineWidth, halfLineWidth));
    }
    else
    {
        // 2 or 3 rects
        NSUInteger lastRect = rectCount - 1;
        
        CGPathMoveToPoint(path, NULL, CGRectGetMinX(rectArray[0]) + halfLineWidth, CGRectGetMaxY(rectArray[0]) + halfLineWidth);
        
        CGPathAddLineToPoint(path, NULL, CGRectGetMinX(rectArray[0]) + halfLineWidth, CGRectGetMinY(rectArray[0]) + halfLineWidth);
        CGPathAddLineToPoint(path, NULL, CGRectGetMaxX(rectArray[0]) - halfLineWidth, CGRectGetMinY(rectArray[0]) + halfLineWidth);
        
        CGPathAddLineToPoint(path, NULL, CGRectGetMaxX(rectArray[0]) - halfLineWidth, CGRectGetMinY(rectArray[lastRect]) - halfLineWidth);
        CGPathAddLineToPoint(path, NULL, CGRectGetMaxX(rectArray[lastRect]) - halfLineWidth, CGRectGetMinY(rectArray[lastRect]) - halfLineWidth);
        
        CGPathAddLineToPoint(path, NULL, CGRectGetMaxX(rectArray[lastRect]) - halfLineWidth, CGRectGetMaxY(rectArray[lastRect]) - halfLineWidth);
        CGPathAddLineToPoint(path, NULL, CGRectGetMinX(rectArray[lastRect]) + halfLineWidth, CGRectGetMaxY(rectArray[lastRect]) - halfLineWidth);
        
        CGPathAddLineToPoint(path, NULL, CGRectGetMinX(rectArray[lastRect]) + halfLineWidth, CGRectGetMaxY(rectArray[0]) + halfLineWidth);
        
        CGPathCloseSubpath(path);
    }
    
    [color set]; // set fill and stroke color
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(ctx, halfLineWidth * 2.);
    CGContextSetLineJoin(ctx, kCGLineJoinRound);
    
    CGContextAddPath(ctx, path);
    CGPathRelease(path);
    
    CGContextDrawPath(ctx, kCGPathFillStroke);
}
@end
