//
//  NSString+Extra.m
//  ViecLamTayTrai
//
//  Created by Anh-Vo on 4/2/15.
//  Copyright (c) 2015 BSP Software Services Corporation. All rights reserved.
//

#import "NSString+Extra.h"
#import <CommonCrypto/CommonDigest.h>
#import "IGFastImage.h"

@implementation NSString (Extra)

- (NSString *)trimWhiteSpace
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (NSString *)MD5{
    const char *cStr = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), result ); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

- (NSString *)stringByDecodingURLFormat {
    NSString *result = [self stringByReplacingOccurrencesOfString:@"+" withString:@" "];
    result = [result stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return result;
}

- (NSMutableDictionary *)dictionaryFromQueryStringComponents {
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    NSArray *keyValueArray = [self componentsSeparatedByString:@"/"];
    
    NSString *key = [[keyValueArray objectAtIndex:1] stringByDecodingURLFormat];
    NSString *value = [[keyValueArray objectAtIndex:2] stringByDecodingURLFormat];
    
    NSMutableArray *results = [parameters objectForKey:key];
    
    if(!results) {
        results = [NSMutableArray arrayWithCapacity:1];
        [parameters setObject:results forKey:key];
    }
    
    [results addObject:value];
    
    return parameters;
}

- (NSMutableDictionary *)dictionaryFromQueryStringComponentsDetail {
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    for (NSString *keyValue in [self componentsSeparatedByString:@"&"]) {
        NSArray *keyValueArray = [keyValue componentsSeparatedByString:@"="];
        if ([keyValueArray count] < 2) {
            continue;
        }
        
        NSString *key = [[keyValueArray objectAtIndex:0] stringByDecodingURLFormat];
        NSString *value = [[keyValueArray objectAtIndex:1] stringByDecodingURLFormat];
        
        NSMutableArray *results = [parameters objectForKey:key];
        
        if(!results) {
            results = [NSMutableArray arrayWithCapacity:1];
            [parameters setObject:results forKey:key];
        }
        
        [results addObject:value];
    }
    
    return parameters;
}

-(NSString *) stringByStrippingHTML {
    NSRange r;
    NSString *s = [self copy];
    while ((r = [s rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
        s = [s stringByReplacingCharactersInRange:r withString:@""];
    return s;
}

-(NSMutableArray*)stringsBetweenString:(NSString*)start andString:(NSString*)end
{
    NSMutableArray* strings = [NSMutableArray arrayWithCapacity:0];
    NSRange startRange = [self rangeOfString:start];
    for( ;; )
    {
        if (startRange.location != NSNotFound)
        {
            NSRange targetRange;
            targetRange.location = startRange.location + startRange.length;
            targetRange.length = [self length] - targetRange.location;
            
            NSRange endRange = [self rangeOfString:end options:0 range:targetRange];
            if (endRange.location != NSNotFound)
            {
                targetRange.length = endRange.location - targetRange.location;
                [strings addObject:[self substringWithRange:targetRange]];
                
                NSRange restOfString;
                
                restOfString.location = endRange.location + endRange.length;
                restOfString.length = [self length] - restOfString.location;
                
                startRange = [self rangeOfString:start options:0 range:restOfString];
            }
            else
            {
                break;
            }
        }
        else
        {
            break;
        }
    }
    return strings;
}

-(NSString *)formatDateWithString:(NSString *)string formatDate:(NSString *)formatDate
{
    if (string.length <=0) {
        return nil;
    }
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:formatDate];
    NSDate *date = [dateFormat dateFromString:string];
    
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    NSString *strDate = [dateFormat stringFromDate:date];
    
    return strDate;
}

-(NSString *)formatDateInput:(NSString *)formatDate formatDateOutput:(NSString*)formatDateOutput
{
    if (self.length <=0) {
        return nil;
    }
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:formatDate];
    NSDate *date = [dateFormat dateFromString:self];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formatDateOutput];
    NSString *stringFromDate = [formatter stringFromDate:date];
    
    
    return stringFromDate;
}

-(NSMutableAttributedString *)attributedString:(NSString *)str font_name:(NSString *)font font_size:(float)font_size fontColor:(UIColor *)fontColor
{
    if ([self isNSStringNilWithString:str]) return nil;
    NSDictionary* fontAttr = @{NSFontAttributeName: [UIFont fontWithName:font size:font_size],
                               NSForegroundColorAttributeName: fontColor};
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:str attributes: fontAttr];
    
    return attrStr;
}

- (NSString*)processImageInHMTLStrings{
    NSMutableArray* imgTag = [self stringsBetweenString:@"<img" andString:@"/>"];
    NSMutableArray *tableTag = [self stringsBetweenString:@"<table" andString:@">"];
    NSString *htmlString = self; //final result
    
    if (tableTag.count > 0) {
        for (int i = 0; i < tableTag.count; i++) {
            NSString *tableTagString = tableTag[i];
            NSString *widthPercent = [[tableTagString stringsBetweenString:@"align=\"" andString:@"\""]firstObject];
            
            tableTagString = [tableTagString stringByReplacingOccurrencesOfString:widthPercent withString:[NSString stringWithFormat:@"left"]];
            
            htmlString = [htmlString stringByReplacingOccurrencesOfString:tableTag[i] withString:tableTagString];
        }
    }
    
    if (imgTag.count > 0) { // image tag found
        for (int i = 0; i<imgTag.count; i++) {
            
            NSString* imgTagString = [imgTag objectAtIndex:i]; // <img..../>
            
            NSString *urlString =[[imgTagString stringsBetweenString:@"src=\"" andString:@"\""] firstObject];

            IGFastImage* image = [[IGFastImage alloc] initWithURL:[NSURL URLWithString:urlString]];
            CGFloat ratio = image.size.height/image.size.width;
            
            if (![imgTagString containSubString:@"width:"] && ![imgTagString containSubString:@"height:"]) { //<img> doesnt have width attribute, add it
                
                imgTagString = [imgTagString stringByAppendingString:[NSString stringWithFormat:@" width=\"%d\"",(int)DEVICE_SIZE.width-20]];
                
                
                imgTagString = [imgTagString stringByAppendingString:[NSString stringWithFormat:@" height=\"%d\"",(int)((DEVICE_SIZE.width-20)*ratio)]];
                
                htmlString = [htmlString stringByReplacingOccurrencesOfString:[imgTag objectAtIndex:i] withString:imgTagString];
//                NSLog(@"%@",htmlString);
            
            }
            else if (![imgTagString containSubString:@"width:"])
            {
                imgTagString = [imgTagString stringByAppendingString:[NSString stringWithFormat:@" width=\"%d\"",(int)DEVICE_SIZE.width-20]];
                
                NSString* heightValue = [[imgTagString stringsBetweenString:@"height:" andString:@"px"]firstObject];
                imgTagString = [imgTagString stringByReplacingOccurrencesOfString:heightValue withString:[NSString stringWithFormat:@"%d",(int)((DEVICE_SIZE.width-20)*ratio)]];
                
                htmlString = [htmlString stringByReplacingOccurrencesOfString:[imgTag objectAtIndex:i] withString:imgTagString];
            }
            else if (![imgTagString containSubString:@"height:"])
            {
                NSString* widthValue = [[imgTagString stringsBetweenString:@"width:" andString:@"px"]firstObject];
                imgTagString = [imgTagString stringByReplacingOccurrencesOfString:widthValue withString:[NSString stringWithFormat:@"%d",(int)DEVICE_SIZE.width-20]];
                
                imgTagString = [imgTagString stringByAppendingString:[NSString stringWithFormat:@" height=\"%d\"",(int)DEVICE_SIZE.width-20]];
                
                htmlString = [htmlString stringByReplacingOccurrencesOfString:[imgTag objectAtIndex:i] withString:imgTagString];
            }
            else
            { // <img> has width attribtue , check then replace suitable value
                
                NSString* widthValue = [[imgTagString stringsBetweenString:@"width:" andString:@"px"]firstObject];
                
                if ([widthValue floatValue] < DEVICE_SIZE.width) {
//                    break;
                }
                else{
                    imgTagString = [imgTagString stringByReplacingOccurrencesOfString:widthValue withString:[NSString stringWithFormat:@"%d",(int)DEVICE_SIZE.width-20]];
                    
                    NSString* heightValue = [[imgTagString stringsBetweenString:@"height:" andString:@"px"]firstObject];
                    
                    imgTagString = [imgTagString stringByReplacingOccurrencesOfString:heightValue withString:[NSString stringWithFormat:@"%d",(int)((DEVICE_SIZE.width-20)*ratio)]];
                    
                    htmlString = [htmlString stringByReplacingOccurrencesOfString:[imgTag objectAtIndex:i] withString:imgTagString];
                }
                
            }
        }
        [imgTag removeAllObjects];
        imgTag = nil;
        [tableTag removeAllObjects];
        tableTag = nil;
        return htmlString;
    }else return self;
}

- (NSString*)processImageInHMTLString{
    
    CGRect screenSize = [[UIScreen mainScreen]bounds];
    NSMutableArray* imgTag = [self stringsBetweenString:@"<img" andString:@"/>"];
    
    if (imgTag.count > 0) { // image tag found
        
        NSString *tagString = self; //final result
        
        for (int i = 0; i<imgTag.count; i++) {
            
            NSString* string = [imgTag objectAtIndex:i]; // <img..../>
            
            if (![string containSubString:@"width"]) { //<img> doesnt have width attribute, add it
                
                NSString* fixedTag = [string stringByAppendingString:[NSString stringWithFormat:@" width=\"%d\"",(int)screenSize.size.width-20]];
                tagString = [tagString stringByReplacingOccurrencesOfString:string withString:fixedTag];
                NSLog(@"%@",tagString);
                
            }else{ // <img> has width attribtue , check then replace suitable value
                
                NSMutableArray* temp = [string stringsBetweenString:@"width:" andString:@"px"];
                for (int i = 0; i<temp.count; i++) {
                    tagString = [tagString stringByReplacingOccurrencesOfString:[temp objectAtIndex:i] withString:[NSString stringWithFormat:@"%f",screenSize.size.width-20]];
                }
                [temp removeAllObjects];
                temp = nil;
            }
        }
        [imgTag removeAllObjects];
        imgTag = nil;
        return tagString;
    }else return self;
}

- (BOOL)containSubString:(NSString*)string{
    NSRange result = [self rangeOfString:string];
    if (result.length > 0) {
        return YES;
    }else
        return NO;
}

- (BOOL)isNSStringNilWithString:(NSString *)str
{
    if(str == nil || [str isKindOfClass:[NSNull class]] || str.length==0)
    {
        return YES;
    }
    else
        return NO;
}

-(BOOL) isValidEmail
{
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

+(NSString*)changeDictionaryToJsonString:(NSDictionary*)valueDict{
    if(valueDict){
        NSError*    error;
        NSData *data = [NSJSONSerialization dataWithJSONObject:valueDict options:0 error:&error];
        NSString *str = nil;
        if(!error){
            str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        }
        return str;
    }else{
        return nil;
    }
}
@end
