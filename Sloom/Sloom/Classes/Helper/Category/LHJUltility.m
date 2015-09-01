//
//  LHJUltility.m
//  ViecLamTayTrai
//
//  Created by Anh-Vo on 4/7/15.
//  Copyright (c) 2015 BSP Software Services Corporation. All rights reserved.
//

#import "LHJUltility.h"


@implementation LHJUltility

#pragma mark - private method



+ (UIImage *)menuImg {
    static UIImage *defaultImage = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(20.f, 13.f), NO, 0.0f);
        
        [[UIColor blackColor] setFill];
        [[UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 20, 1)] fill];
        [[UIBezierPath bezierPathWithRect:CGRectMake(0, 5, 20, 1)] fill];
        [[UIBezierPath bezierPathWithRect:CGRectMake(0, 10, 20, 1)] fill];
        [[UIBezierPath bezierPathWithRect:CGRectMake(0, 15, 20, 1)] fill];
        

        [[UIBezierPath bezierPathWithRect:CGRectMake(0, 1, 20, 0.5)] fill];
        [[UIBezierPath bezierPathWithRect:CGRectMake(0, 6,  20, 0.5)] fill];
        [[UIBezierPath bezierPathWithRect:CGRectMake(0, 11, 20, 0.5)] fill];
        [[UIBezierPath bezierPathWithRect:CGRectMake(0, 16, 20, 1)] fill];
        
        defaultImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
    });
    return defaultImage;
}

+ (BOOL)validateEmail:(UITextField*)textField{
    NSString *email = textField.text;
    NSString *stricterFilterString = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", stricterFilterString];
    if (email.length == 0) {
        
       // [Utility showErrorMessage:@"Vui lòng nhập email"];
        
        return NO;
    }else if (![emailTest evaluateWithObject:email]) {
        
        //[LHJUltility showErrorMessage:@"Vui lòng nhập đúng định dạng email" withTitle:@""];
        
        return NO;
    }else{
        return YES;
    }
}

@end
