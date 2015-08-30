//
//  ACVHomeViewController.m
//  Chovinh
//
//  Created by khoa.vt on 8/12/15.
//  Copyright (c) 2015 khoa.vt. All rights reserved.
//
#import "XLPagerTabStripViewController.h"
#import "ACVHomeViewController.h"
#import "ACVUtilities.h"
#import "ButtonBarExampleViewController.h"
#import "AppDelegate.h"

@interface ACVHomeViewController ()

@end

@implementation ACVHomeViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[self childViewControllers] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[XLPagerTabStripViewController class]]){
            XLPagerTabStripViewController * pagerController = (id)obj;
            [self updateTitle:pagerController];
            *stop = YES;
        }
    }];
//    
//    if (!_accountInfoBackgroundView) {
//        _accountInfoBackgroundView = [[ACVAccountBackgroundView alloc] initWithFrame:self.view.frame];
//        _accountInfoBackgroundView.delegate = self;
//        _accountInfoBackgroundView.userInteractionEnabled = NO;
//        [self.view addSubview:_accountInfoBackgroundView];
//    }
//    
//    _accountInfoContentView = [[ACVAccountContentView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width - 32, self.view.frame.size.height)];
//    _accountInfoContentView.delegate = self;
//    [self.view addSubview:_accountInfoContentView];

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
}

- (IBAction)reloadTapped:(id)sender {
    [[self childViewControllers] enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[XLPagerTabStripViewController class]]){
            XLPagerTabStripViewController * pagerController = (id)obj;
            [pagerController reloadPagerTabStripView];
            [self updateTitle:pagerController];
            *stop = YES;
        }
    }];
}

-(void)updateTitle:(XLPagerTabStripViewController *)pagerController
{
    NSString * title = [NSString stringWithFormat:@"Progressive = %@  ElasticLimit = %@",[self stringFromBool:pagerController.isProgressiveIndicator] ,[self stringFromBool:pagerController.isElasticIndicatorLimit]];
//    self.titleLabel.text = title;
    ((UILabel *)self.navigationItem.titleView).text = title;
    [((UILabel *)self.navigationItem.titleView) sizeToFit];
}

-(NSString *)stringFromBool:(BOOL)value
{
    return value ? @"YES" : @"NO";
}

#pragma mark ACVAccountBackgroundViewDelegate

- (void)touchEndedWithACVAccountBackgroundView:(ACVAccountBackgroundView *)accountBackgroundView{
    [UIView animateWithDuration:0.3 animations:^{
        
            [_accountInfoContentView setFrame:CGRectMake(- _accountInfoContentView.frame.size.width + 12, _accountInfoContentView.frame.origin.y, _accountInfoContentView.frame.size.width, _accountInfoContentView.frame.size.height)];
            [_accountInfoBackgroundView setFrame:CGRectMake(- _accountInfoContentView.frame.size.width + 12, _accountInfoBackgroundView.frame.origin.y, _accountInfoBackgroundView.frame.size.width, _accountInfoBackgroundView.frame.size.height)];
        
    } completion:^(BOOL finished) {
        _accountInfoContentView.show = NO;
        _accountInfoBackgroundView.userInteractionEnabled = NO;
        
    }];
   
}

#pragma mark ACVAccountContentViewDelegate

- (void)touchMoveWithACVAccountContentView:(ACVAccountContentView *)accountContentView withBeginPoint:(CGPoint)beginTouchPoint withCurrentPoint:(CGPoint)currentTouchPoint {
    if (_accountInfoContentView.frame.origin.x + (currentTouchPoint.x - beginTouchPoint.x) <= 0) {
        [_accountInfoContentView setFrame:CGRectMake(_accountInfoContentView.frame.origin.x + (currentTouchPoint.x - beginTouchPoint.x), _accountInfoContentView.frame.origin.y , _accountInfoContentView.frame.size.width, _accountInfoContentView.frame.size.height)];
        [_accountInfoBackgroundView setFrame:CGRectMake(_accountInfoContentView.frame.origin.x + (currentTouchPoint.x - beginTouchPoint.x), _accountInfoContentView.frame.origin.y , _accountInfoBackgroundView.frame.size.width, _accountInfoBackgroundView.frame.size.height)];
    }
}

- (void)touchEndedWithACVAccountContentView:(ACVAccountContentView *)accountContentView {
    
    if (fabs(_accountInfoContentView.frame.origin.x - 12) <= _accountInfoContentView.frame.size.width/2) {
        [UIView animateWithDuration:0.3 animations:^{
            [_accountInfoContentView setFrame:CGRectMake(0, _accountInfoContentView.frame.origin.y, _accountInfoContentView.frame.size.width, _accountInfoContentView.frame.size.height)];
            [_accountInfoBackgroundView setFrame:CGRectMake(0, _accountInfoBackgroundView.frame.origin.y, _accountInfoBackgroundView.frame.size.width, _accountInfoBackgroundView.frame.size.height)];
            
        } completion:^(BOOL finished) {
            _accountInfoContentView.show = YES;
            _accountInfoBackgroundView.userInteractionEnabled = YES;
            
        }];
    }
    else {
        [self touchEndedWithACVAccountBackgroundView:nil];
    }
}

@end
