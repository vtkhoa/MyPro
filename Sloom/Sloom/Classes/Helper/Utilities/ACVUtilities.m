//
//  ACVUtilities.m
//  Chovinh
//
//  Created by khoa.vt on 8/15/15.
//  Copyright (c) 2015 khoa.vt. All rights reserved.
//

#import "ACVUtilities.h"


@implementation ACVUtilities


+ (NSString*)genUUID {
    return  [[NSUUID UUID] UUIDString];
}

+ (UIImage*) blurWithImage:(UIImage*)theImage radius:(float)radius
{
    // ***********If you need re-orienting (e.g. trying to blur a photo taken from the device camera front facing camera in portrait mode)
    // theImage = [self reOrientIfNeeded:theImage];
    
    // create our blurred image
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *inputImage = [CIImage imageWithCGImage:theImage.CGImage];
    
    // setting up Gaussian Blur (we could use one of many filters offered by Core Image)
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:inputImage forKey:kCIInputImageKey];
    [filter setValue:[NSNumber numberWithFloat:radius] forKey:@"inputRadius"];
    CIImage *result = [filter valueForKey:kCIOutputImageKey];
    
    // CIGaussianBlur has a tendency to shrink the image a little,
    // this ensures it matches up exactly to the bounds of our original image
    CGImageRef cgImage = [context createCGImage:result fromRect:[inputImage extent]];
    
    UIImage *returnImage = [UIImage imageWithCGImage:cgImage];//create a UIImage for this function to "return" so that ARC can manage the memory of the blur... ARC can't manage CGImageRefs so we need to release it before this function "returns" and ends.
    CGImageRelease(cgImage);//release CGImageRef because ARC doesn't manage this on its own.
    
    return returnImage;
    
    // *************** if you need scaling
    // return [[self class] scaleIfNeeded:cgImage];
}


+ (DeviceType)getTypeDevice {
    //NSLog(@"size: %f,%f",DEVICE_SIZE2.width,DEVICE_SIZE2.height);
    CGFloat screenScale = [[UIScreen mainScreen] scale];
    
    if (screenScale >= 3.0) {
        return D_Iphone_6_Plus;
    }
    if(DEVICE_SIZE.height == 480)
    {
        // iPhone Classic
        // NSLog(@"Iphone4");
        return D_Iphone_4;
    }
    if(DEVICE_SIZE.height == 568){
        //  NSLog(@"Iphone5");
        return D_Iphone_5;
    }
    if (DEVICE_SIZE.height == 667){
        //  NSLog(@"Iphone6");
        return D_Iphone_6;
    }
    if (DEVICE_SIZE.height == 736) {
        //  NSLog(@"Iphone6plus");
        return D_Iphone_6_Plus;
    }if (DEVICE_SIZE.height == 1024) {
        //  NSLog(@"Ipad2");
        return D_Ipad2;
    }
    
    return D_Other;
}

+ (CGFloat)getDeviceHeigh {
    //NSLog(@"size: %f,%f",DEVICE_SIZE2.width,DEVICE_SIZE2.height);
    CGFloat screenScale = [[UIScreen mainScreen] scale];
    
    if (screenScale >= 3.0) {
        return 736;
    }
    if(DEVICE_SIZE.height == 480)
    {
        // iPhone Classic
        // NSLog(@"Iphone4");
        return 480;
    }
    if(DEVICE_SIZE.height == 568){
        //  NSLog(@"Iphone5");
        return 568;
    }
    if (DEVICE_SIZE.height == 667){
        //  NSLog(@"Iphone6");
        return 667;
    }
    
    return 0;
}

+ (CGFloat)getDeviceWidth {
    //NSLog(@"size: %f,%f",DEVICE_SIZE2.width,DEVICE_SIZE2.height);
    CGFloat screenScale = [[UIScreen mainScreen] scale];
    
    if (screenScale >= 3.0) {
        return 414;
    }
    if(DEVICE_SIZE.height == 480)
    {
        // iPhone Classic
        // NSLog(@"Iphone4");
        return 320;
    }
    if(DEVICE_SIZE.height == 568){
        //  NSLog(@"Iphone5");
        return 320;
    }
    if (DEVICE_SIZE.height == 667){
        //  NSLog(@"Iphone6");
        return 375;
    }
    
    return 0;
}

+ (UIColor *)colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
};

+ (NSString*)getDocumentPath {
    NSArray *searchPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = [searchPaths objectAtIndex:0];
    return documentPath;
}

+ (int)compareDateString1:(NSString*)dateString1 toDateString2:(NSString*)dateString2 {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date1 = [dateFormatter dateFromString:dateString1];
    NSDate *date2 = [dateFormatter dateFromString:dateString2];
    if ([date1 compare:date2] == NSOrderedDescending) {
        return 1;
    } else if ([date1 compare:date2] == NSOrderedAscending) {
        return -1;
    } else {
        return 0;
    }
}

+ (BOOL)addSkipBackupAttributeToItemAtPath:(NSString *) filePathString {
    
    NSURL* URL= [NSURL fileURLWithPath: filePathString];
    assert([[NSFileManager defaultManager] fileExistsAtPath: [URL path]]);
    
    NSError *error = nil;
    BOOL success = [URL setResourceValue: [NSNumber numberWithBool: YES]
                                  forKey: NSURLIsExcludedFromBackupKey error: &error];
    if(!success){
        NSLog(@"Error excluding %@ from backup %@", [URL lastPathComponent], error);
    }
    return success;
}

@end
