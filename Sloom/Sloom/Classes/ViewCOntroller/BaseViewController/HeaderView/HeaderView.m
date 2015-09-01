//
//  HeaderView.m
//  Sloom
//
//  Created by Jonny Chinh Tran on 9/1/15.
//  Copyright (c) 2015 khoa.vt. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self options:nil];
        self = [nib objectAtIndex:0];
        self.frame = frame;
    }
    
    return  self;
}

- (IBAction)btnRight:(id)sender {
    if ([self.delegate respondsToSelector:@selector(selectBtnRight)]) {
        [self.delegate selectBtnRight];
    }
}

- (IBAction)btnLeft:(id)sender {
    if ([self.delegate respondsToSelector:@selector(selectBtnLeft)]) {
        [self.delegate selectBtnLeft];
    }
}
@end
