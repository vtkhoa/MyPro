//
//  BaseViewController.h
//  Sloom
//
//  Created by Jonny Chinh Tran on 9/1/15.
//  Copyright (c) 2015 khoa.vt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeaderView.h"
@interface BaseViewController : UIViewController<HeaderViewDelegate>
-(void)setLeftHeader:(UIImage*)image stringLabel:(NSString*)strLabel;
-(void)setRightHeader:(UIImage*)image stringLabel:(NSString*)strLabel;
-(void)selectBtnLeft;
-(void)selectBtnRight;
-(void)setTitleHeader:(NSString*)strTitle;
-(void)setHiddenViewHeader:(BOOL)status;
@end
