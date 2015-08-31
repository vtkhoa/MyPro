//
//  Utility.h
//  Zazz
//
//  Created by Cuong Voong Tan Quoc on 8/22/15.
//  Copyright (c) 2015 Quodisys. All rights reserved.
//

#import <Foundation/Foundation.h>
//hexColor
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
@interface Utility : NSObject

+ (NSString*)strAuthorizationToken;
+ (void) AlertViewOKButtonWithMessage:(NSString *)str;
+ (NSString*)getQueryStringFromDictionary:(NSDictionary *)dictionary;
+ (NSString*)urlEscapeString:(NSString *)unencodedString;
+ (void) AlertViewOKButtonWithDictionary:(NSDictionary *)dict;

@end
