//
//  UITextField+Extra.m
//  ViecLamTayTrai
//
//  Created by Cuong Voong Tan Quoc on 6/2/15.
//  Copyright (c) 2015 BSP Software Services Corporation. All rights reserved.
//

#import "UITextField+Extra.h"
#import "NSMutableAttributedString+Attributes.h"
#define kCornerRadiusForTextField 5
#define kButtonBorderGrayColor [UIColor grayColor]
@implementation UITextField (Extra)

-(void)formatTextFieldWithUITextField
{
    UIView *spacerViewUsername = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 8, self.frame.size.height)];
    [self setLeftViewMode:UITextFieldViewModeAlways];
    [self setLeftView:spacerViewUsername];
    
    [self setBorderStyle:UITextBorderStyleNone];
    self.layer.cornerRadius = kCornerRadiusForTextField;
    self.layer.borderWidth = 0.5;
    
    self.layer.borderColor = kButtonBorderGrayColor.CGColor;
    self.layer.masksToBounds = YES;
}

-(void)formatTextFieldWithUITextFieldRight
{
    UIView *spacerViewUsername = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 8, self.frame.size.height)];
    [self setRightViewMode:UITextFieldViewModeAlways];
    [self setRightView:spacerViewUsername];
    [self setBorderStyle:UITextBorderStyleNone];
    self.layer.cornerRadius = kCornerRadiusForTextField;
    self.layer.borderWidth = 0.5;
    self.layer.borderColor = kButtonBorderGrayColor.CGColor;
    self.layer.masksToBounds = YES;
}
-(void)formatTextFieldWithHardText:(NSString*) text{
    NSMutableAttributedString *hardTextAttString = [[NSMutableAttributedString alloc]initWithString:text];
    [hardTextAttString addFontWithName:self.font.fontName size:self.font.pointSize substring:text];
    [hardTextAttString addColor:[UIColor grayColor] substring:text];
    
    CGSize textSize = [text sizeWithAttributes:@{ NSFontAttributeName : [UIFont fontWithName:self.font.fontName size:self.font.pointSize] }];
    
    UITextField *hardTextField = [[UITextField alloc]initWithFrame:CGRectMake(5, 0, textSize.width+8, self.frame.size.height)];
    UIView *spacerViewUsername = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 8, self.frame.size.height)];
    [hardTextField setLeftViewMode:UITextFieldViewModeAlways];
    [hardTextField setLeftView:spacerViewUsername];
    hardTextField.enabled = NO;
    hardTextField.attributedText = hardTextAttString;
    
    [self setLeftViewMode:UITextFieldViewModeAlways];
    [self setLeftView:hardTextField];
}

-(void)removeHardText{
    [self setLeftViewMode:UITextFieldViewModeNever];
    [self setLeftView:nil];
}
@end
