//
//  TopViewEditProfile.h
//  Sloom
//
//  Created by Jonny Chinh Tran on 9/4/15.
//  Copyright (c) 2015 khoa.vt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopViewEditProfile : UIView
@property (weak, nonatomic) IBOutlet UIImageView *imageAvatar;
@property (weak, nonatomic) IBOutlet UIButton *btnChange;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contraintWidthImageAvatar;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contraintHeightBtnChange;

- (IBAction)btnChange:(id)sender;
@end
