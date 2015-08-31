//
//  NSDate+LHJParseDate.m
//  ViecLamTayTrai
//
//  Created by Anh-Vo on 4/2/15.
//  Copyright (c) 2015 BSP Software Services Corporation. All rights reserved.
//

#import "NSDate+LHJParseDate.h"

#define HANOI_TIMEZONE 25200

@implementation NSDate (LHJParseDate)

+ (NSCalendar *) defaultCalendarOfLHJ{
    static NSCalendar *gregorianCalendar = nil;
    if (!gregorianCalendar) {
        gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        gregorianCalendar.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:HANOI_TIMEZONE];
        gregorianCalendar.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"vi_VN"];
    }
    return gregorianCalendar;
}

+ (NSDate *) dateFromString: (NSString *) string{
    return [self dateFromString:string withDateFormat:@"yyyy/MM/dd"];
}

+ (NSDate *) dateFromString: (NSString *) string withDateFormat: (NSString *) dateFormater{
    
    if (string.length <= 0) {
        return nil;
    }
    
    static NSDateFormatter *dateFormatter = nil;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setCalendar:[NSDate defaultCalendarOfLHJ]];
        dateFormatter.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:HANOI_TIMEZONE];
        [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"vi_VN"]];
    }
    [dateFormatter setDateFormat:dateFormater];
    return [dateFormatter dateFromString:string];
}

+ (NSDate *) dateWithDateComponents:(void(^)(NSDateComponents *)) componentBlock{
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    componentBlock(comps);
    [comps setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:HANOI_TIMEZONE]];
    NSDate *date = [[NSDate defaultCalendarOfLHJ] dateFromComponents:comps];
    return date;
}

- (NSString *) stringWithDateFormatter:(void(^)(NSDateFormatter *)) dateFormatterBlock{
    static NSDateFormatter *dateFormatter = nil;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setCalendar:[NSDate defaultCalendarOfLHJ]];
        dateFormatter.timeZone = [NSTimeZone timeZoneForSecondsFromGMT:HANOI_TIMEZONE];
        [dateFormatter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"vi_VN"]];
    }
    dateFormatterBlock(dateFormatter);
    return [dateFormatter stringFromDate:self];
}
@end
