//
//  NSString+Extra.h
//  ViecLamTayTrai
//
//  Created by Anh-Vo on 4/2/15.
//  Copyright (c) 2015 BSP Software Services Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extra)

+ (NSString*)changeDictionaryToJsonString:(NSDictionary*)valueDict;
- (NSString*)trimWhiteSpace;
- (NSString *)MD5;
- (NSMutableDictionary *)dictionaryFromQueryStringComponents;
- (NSMutableDictionary *)dictionaryFromQueryStringComponentsDetail;
- (NSString *)stringByDecodingURLFormat;
- (NSString *) stringByStrippingHTML;
- (NSMutableArray*)stringsBetweenString:(NSString*)start andString:(NSString*)end;
- (NSMutableAttributedString *)attributedString:(NSString *)str font_name:(NSString *)font font_size:(float)font_size fontColor:(UIColor *)fontColor;
- (NSString*)processImageInHMTLString;
- (NSString*)processImageInHMTLStrings;
- (NSString *)formatDateWithString:(NSString *)string formatDate:(NSString *)formatDate;
- (NSString *)formatDateInput:(NSString *)formatDate formatDateOutput:(NSString*)formatDateOutput;
- (BOOL)isNSStringNilWithString:(NSString *)str;
- (BOOL)isValidEmail;

@end
