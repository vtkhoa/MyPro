//
//  ACVAccountBackgroundView.m
//  Chovinh
//
//  Created by khoa.vt on 8/18/15.
//  Copyright (c) 2015 khoa.vt. All rights reserved.
//

#import "ACVAccountBackgroundView.h"

@implementation ACVAccountBackgroundView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setFrame:CGRectMake(-frame.size.width + 44, 0, frame.size.width, frame.size.height)];
//        [self setBackgroundColor:[UIColor blackColor]];
        
    }
    
    return self;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if (_delegate && [_delegate respondsToSelector:@selector(touchEndedWithACVAccountBackgroundView:)]) {
        [_delegate touchEndedWithACVAccountBackgroundView:self];
    }
    
}

@end
