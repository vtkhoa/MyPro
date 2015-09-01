//
//  HeaderView.h
//  Sloom
//
//  Created by Jonny Chinh Tran on 9/1/15.
//  Copyright (c) 2015 khoa.vt. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HeaderViewDelegate <NSObject>

-(void)selectBtnRight;
-(void)selectBtnLeft;

@end

@interface HeaderView : UIView

@property (weak, nonatomic) IBOutlet UILabel *lbTitle;
@property (weak, nonatomic) IBOutlet UILabel *lbLeft;
@property (weak, nonatomic) IBOutlet UILabel *lbRight;
@property (weak, nonatomic) IBOutlet UIImageView *imageLeft;
@property (weak, nonatomic) IBOutlet UIImageView *imageRight;
@property (weak, nonatomic) id<HeaderViewDelegate>delegate;
- (IBAction)btnRight:(id)sender;

- (IBAction)btnLeft:(id)sender;

@end
