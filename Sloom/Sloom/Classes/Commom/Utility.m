//
//  Utility.m
//  Zazz
//
//  Created by Cuong Voong Tan Quoc on 8/22/15.
//  Copyright (c) 2015 Quodisys. All rights reserved.
//

#import "Utility.h"

@implementation Utility

+ (void) AlertViewOKButtonWithMessage:(NSString *)str
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:str delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
}

+ (void) AlertViewOKButtonWithDictionary:(NSDictionary *)dict
{
    NSString *str = @"";
    
    if ([[dict objectForKey:@"error"] isEqualToString:@"invalid_grant"])
    {
        str = @"The username or password is wrong";
    }
    else
    {
        str = [dict objectForKey:@"error"];
    }
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:str delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
}

+ (NSString*)urlEscapeString:(NSString *)unencodedString
{
    CFStringRef originalStringRef = (__bridge_retained CFStringRef)unencodedString;
    NSString *s = (__bridge_transfer NSString *)CFURLCreateStringByAddingPercentEscapes(NULL,originalStringRef, NULL, NULL,kCFStringEncodingUTF8);
    CFRelease(originalStringRef);
    return s;
}

+ (NSString*)getQueryStringFromDictionary:(NSDictionary *)dictionary
{
    NSMutableString *urlWithQuerystring = [[NSMutableString alloc] initWithString:@""];
    
    for (id key in dictionary) {
        NSString *keyString = [key description];
        NSString *valueString = [[dictionary objectForKey:key] description];
        if ([urlWithQuerystring isEqualToString:@""]) {
            [urlWithQuerystring appendFormat:@"%@=%@", [self urlEscapeString:keyString], [self urlEscapeString:valueString]];
        } else {
            [urlWithQuerystring appendFormat:@"&%@=%@", [self urlEscapeString:keyString], [self urlEscapeString:valueString]];
        }
    }
    return urlWithQuerystring;
}

+(NSString*)strAuthorizationToken
{
    return [NSString stringWithFormat:@"%@ %@",[UserDefault valueForKey:kTokenType], [UserDefault valueForKey:kAccessToken]];
}

@end
