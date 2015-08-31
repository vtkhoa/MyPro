//
//  UITextField+Extra.h
//  ViecLamTayTrai
//
//  Created by Cuong Voong Tan Quoc on 6/2/15.
//  Copyright (c) 2015 BSP Software Services Corporation. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (Extra)

-(void)formatTextFieldWithUITextField;
-(void)formatTextFieldWithUITextFieldRight;
-(void)formatTextFieldWithHardText:(NSString*) text;
-(void)removeHardText;
@end
