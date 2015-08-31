//
//  UILabel+Expand.h
//  ViecLamTayTrai
//
//  Created by AuNguyen on 4/13/15.
//  Copyright (c) 2015 BSP Software Services Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Expand)

- (void)setHtml:(NSString*)html;
- (void)setFontWithUILabel:(UILabel *)label fontName:(NSString *)fontName fontSize:(float)fontSize;

- (CGFloat)heightOfUILabelWithString:(NSString *)str widthContent:(CGFloat)width FontName:(NSString *)fontName FontSize:(float)font_size;

@end
