//
//  ACVAccountContentView.m
//  Chovinh
//
//  Created by khoa.vt on 8/17/15.
//  Copyright (c) 2015 khoa.vt. All rights reserved.
//

#import "ACVAccountContentView.h"

@interface ACVAccountContentView () {
    UITouch *currentTouch;
}

@end

@implementation ACVAccountContentView
@synthesize beginPoint;
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (id)initWithFrame:(CGRect)frame {
    self = [[[NSBundle mainBundle] loadNibNamed:@"ACVAccountContentView" owner:nil options:nil] objectAtIndex:0];
    if (self) {        
        [self setFrame:CGRectMake(-frame.size.width + 12, 0, frame.size.width, frame.size.height)];
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [[[event allTouches] allObjects] objectAtIndex:0];
    beginPoint = [touch locationInView:touch.view];
    currentTouch = touch;
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    if (currentTouch) {
        CGPoint touchPoint = [currentTouch locationInView:currentTouch.view];
        if (_delegate && [_delegate respondsToSelector:@selector(touchMoveWithACVAccountContentView:withBeginPoint:withCurrentPoint:)]) {
            [_delegate touchMoveWithACVAccountContentView:self withBeginPoint:beginPoint withCurrentPoint:touchPoint];
        }
        
    }
    else {
        UITouch *touch = [[[event allTouches] allObjects] objectAtIndex:0];
        CGPoint point = [touch locationInView:touch.view];        
        currentTouch = touch;
        beginPoint = point;
        CGPoint touchPoint = [currentTouch locationInView:currentTouch.view];
        if (_delegate && [_delegate respondsToSelector:@selector(touchMoveWithACVAccountContentView:withBeginPoint:withCurrentPoint:)]) {
            [_delegate touchMoveWithACVAccountContentView:self withBeginPoint:beginPoint withCurrentPoint:touchPoint];
        }
        
        
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if (_delegate && [_delegate respondsToSelector:@selector(touchEndedWithACVAccountContentView:)]) {
        [_delegate touchEndedWithACVAccountContentView:self];
    }
    
}


@end
