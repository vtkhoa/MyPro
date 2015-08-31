//
//  NSDate+LHJParseDate.h
//  ViecLamTayTrai
//
//  Created by Anh-Vo on 4/2/15.
//  Copyright (c) 2015 BSP Software Services Corporation. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (LHJParseDate)

+ (NSDate *) dateFromString: (NSString *) string;
+ (NSDate *) dateFromString: (NSString *) string withDateFormat: (NSString *) dateFormater;
+ (NSDate *) dateWithDateComponents:(void(^)(NSDateComponents *)) componentBlock;
- (NSString *) stringWithDateFormatter:(void(^)(NSDateFormatter *)) dateFormatterBlock;

@end
