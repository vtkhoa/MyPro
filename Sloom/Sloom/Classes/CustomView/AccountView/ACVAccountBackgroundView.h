//
//  ACVAccountBackgroundView.h
//  Chovinh
//
//  Created by khoa.vt on 8/18/15.
//  Copyright (c) 2015 khoa.vt. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ACVAccountBackgroundView;
@protocol ACVAccountBackgroundViewDelegate <NSObject>

- (void)touchEndedWithACVAccountBackgroundView:(ACVAccountBackgroundView*)accountBackgroundView;

@end

@interface ACVAccountBackgroundView : UIView
@property (nonatomic, assign) BOOL show;
@property (nonatomic, assign) CGPoint beginPoint;
@property (nonatomic, weak) id<ACVAccountBackgroundViewDelegate> delegate;
@end
