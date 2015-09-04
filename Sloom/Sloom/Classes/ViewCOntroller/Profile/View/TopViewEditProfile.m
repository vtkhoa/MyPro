//
//  TopViewEditProfile.m
//  Sloom
//
//  Created by Jonny Chinh Tran on 9/4/15.
//  Copyright (c) 2015 khoa.vt. All rights reserved.
//

#import "TopViewEditProfile.h"
#import "UIView+Extra.h"
#import "UIButton+Extra.h"
@implementation TopViewEditProfile

-(void)awakeFromNib{
    
    [_imageAvatar setLayerCornerRadius:_contraintWidthImageAvatar.constant/2];
    [_btnChange setLayerBorderWidth:KBoderButtonWidth borderColor:kButtonBorderGrayColor cornerRadius:_contraintHeightBtnChange.constant/2];
    [_btnChange setTitle:@"Change picture" forState:UIControlStateNormal];
    [_btnChange setTitleColor:kButtonBorderGrayColor forState:UIControlStateNormal];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TopViewEditProfile" owner:self options:nil];
        self = [nib objectAtIndex:0];
        self.frame = frame;
    }
    
    return  self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (IBAction)btnChange:(id)sender {
}
@end
