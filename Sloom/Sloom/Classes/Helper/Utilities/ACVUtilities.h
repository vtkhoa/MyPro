//
//  ACVUtilities.h
//  Chovinh
//
//  Created by khoa.vt on 8/15/15.
//  Copyright (c) 2015 khoa.vt. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ACVUtilities : NSObject

typedef enum {
    D_Iphone_4,   // 3.5 inch
    D_Iphone_5,   // 4 inch
    D_Iphone_6,   // 4.7 inch
    D_Iphone_6_Plus, // 5.5 inch
    D_IpadMini,   // 7.9 inch
    D_Ipad2,       // 9.7 inch
    D_Other        // other
} DeviceType;

+ (NSString*)genUUID;
+ (UIImage*) blurWithImage:(UIImage*)theImage radius:(float)radius;
+ (DeviceType)getTypeDevice;
+ (UIColor *)colorFromHexString:(NSString *)hexString;
+ (CGFloat)getDeviceHeigh;
+ (CGFloat)getDeviceWidth;
+ (NSString*)getDocumentPath;
+ (BOOL)addSkipBackupAttributeToItemAtPath:(NSString *)filePathString;

@end
