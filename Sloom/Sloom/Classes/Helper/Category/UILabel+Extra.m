//
//  UILabel+Expand.m
//  ViecLamTayTrai
//
//  Created by AuNguyen on 4/13/15.
//  Copyright (c) 2015 BSP Software Services Corporation. All rights reserved.
//

#import "UILabel+Extra.h"

@implementation UILabel (Expand)


- (void) setHtml: (NSString*) html
{
    NSError *err = nil;
    html = [html stringByAppendingString:[NSString stringWithFormat:@"<style>body{font-family: '%@'; font-size:%fpx;}</style>",
                                     self.font.fontName,
                                     self.font.pointSize]];
    self.attributedText =
    [[NSAttributedString alloc]
     initWithData: [html dataUsingEncoding:NSUTF32StringEncoding]
     options: @{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType }
     documentAttributes: nil
     error: &err];
    if(err)
        NSLog(@"Error when set HTML string: %@", err);
}

- (void)setFontWithUILabel:(UILabel *)label fontName:(NSString *)fontName fontSize:(float)fontSize
{
    [label setFont:[UIFont fontWithName:fontName size:fontSize]];
}

-(CGFloat)heightOfUILabelWithString:(NSString *)str widthContent:(CGFloat)width FontName:(NSString *)fontName FontSize:(float)font_size
{
    UIFont *font = [UIFont fontWithName:fontName size:font_size];
    NSAttributedString *attributedText = [[NSAttributedString alloc] initWithString:str attributes:@{NSFontAttributeName: font, NSKernAttributeName : @(1.0f)}];
    CGRect rect = [attributedText boundingRectWithSize:(CGSize){width, CGFLOAT_MAX}
                                               options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading )
                                               context:nil];
    CGSize size = rect.size;
    size.height = ceilf(size.height);
    
    return size.height;
}

@end

