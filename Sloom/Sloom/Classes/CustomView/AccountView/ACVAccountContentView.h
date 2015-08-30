//
//  ACVAccountContentView.h
//  Chovinh
//
//  Created by khoa.vt on 8/17/15.
//  Copyright (c) 2015 khoa.vt. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ACVAccountContentView;
@protocol ACVAccountContentViewDelegate <NSObject>

-(void)touchEndedWithACVAccountContentView:(ACVAccountContentView*)accountContentView;
-(void)touchMoveWithACVAccountContentView:(ACVAccountContentView*)accountContentView withBeginPoint:(CGPoint)beginTouchPoint withCurrentPoint:(CGPoint)currentTouchPoint;

@end
@interface ACVAccountContentView : UIView
@property (nonatomic, assign) CGPoint beginPoint;
@property (nonatomic, assign) BOOL show;
@property (nonatomic, weak) id<ACVAccountContentViewDelegate> delegate;

@end
