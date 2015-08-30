//
//  ACVHomeViewController.h
//  Chovinh
//
//  Created by khoa.vt on 8/12/15.
//  Copyright (c) 2015 khoa.vt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ACVAccountBackgroundView.h"
#import "ACVAccountContentView.h"


@interface ACVHomeViewController : UIViewController<ACVAccountBackgroundViewDelegate, ACVAccountContentViewDelegate>
@property (retain, nonatomic)  ACVAccountBackgroundView *accountInfoBackgroundView;
@property (retain, nonatomic)  ACVAccountContentView *accountInfoContentView;
@property (weak, nonatomic) IBOutlet UIView *containerView;

@property (nonatomic, assign) BOOL isChild;

@end
