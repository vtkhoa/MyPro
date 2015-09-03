//
//  UITextField+Extra.h
//  ViecLamTayTrai
//
//  Created by Cuong Voong Tan Quoc on 6/2/15.
//  Copyright (c) 2015 BSP Software Services Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kCornerRadiusForTextField 22
#define kTextFieldBorderGrayColor [UIColor colorWithRed:148/255.0f green:150/255.0f blue:153/255.0f alpha:1.0f]
#define kTextFieldPlaceholder [UIColor colorWithRed:209/255.0f green:211/255.0f blue:212/255.0f alpha:1.0f]
@interface UITextField (Extra)

-(void)formatTextFieldWithUITextField;
-(void)formatTextFieldWithUITextFieldRight;
-(void)formatTextFieldWithHardText:(NSString*) text;
-(void)removeHardText;
@end
