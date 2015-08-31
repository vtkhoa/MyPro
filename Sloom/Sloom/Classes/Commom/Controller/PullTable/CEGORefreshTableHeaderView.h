//
//  CEGORefreshTableHeaderView.h
//  Movies
//
//  Created by VuongTC on 3/26/14.
//  Copyright (c) 2014 Hung Vu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

typedef enum{
	EGOOPullPulling = 0,
	EGOOPullNormal,
	EGOOPullLoading,
} EGOPullState;

#define DEFAULT_ARROW_IMAGE         [UIImage imageNamed:@"blueArrow.png"]
//#define DEFAULT_BACKGROUND_COLOR    [UIColor colorWithRed:217/255.0 green:214/255.0 blue:202/255.0 alpha:1.0]
//#define DEFAULT_BACKGROUND_COLOR    [UIColor colorWithRed:197/255.0 green:194/255.0 blue:176/255.0 alpha:1.0]
#define DEFAULT_BACKGROUND_COLOR    [UIColor whiteColor]
#define DEFAULT_TEXT_COLOR          [UIColor colorWithRed:2/255.0 green:38/255.0 blue:48/255.0 alpha:1.0]
#define DEFAULT_ACTIVITY_INDICATOR_STYLE    UIActivityIndicatorViewStyleGray
#define FONT_REGULAR @"OpenSans"

#define FLIP_ANIMATION_DURATION 0.18f

#define PULL_AREA_HEIGTH 60.0f
#define PULL_TRIGGER_HEIGHT (PULL_AREA_HEIGTH + 5.0f)


@protocol CEGORefreshTableHeaderDelegate;
@interface CEGORefreshTableHeaderView : UIView {
	
	id _delegate;
	EGOPullState _state;
    
	UILabel *_lastUpdatedLabel;
	UILabel *_statusLabel;
	CALayer *_arrowImage;
	UIActivityIndicatorView *_activityView;
    
    // Set this to Yes when egoRefreshTableHeaderDidTriggerRefresh delegate is called and No with egoRefreshScrollViewDataSourceDidFinishedLoading
    BOOL isLoading;
	
}

@property(nonatomic,assign) id <CEGORefreshTableHeaderDelegate> delegate;

- (void)refreshLastUpdatedDate;
- (void)egoRefreshScrollViewDidScroll:(UIScrollView *)scrollView;
- (void)egoRefreshScrollViewDidEndDragging:(UIScrollView *)scrollView;
- (void)egoRefreshScrollViewWillBeginDragging:(UIScrollView *)scrollView;
- (void)egoRefreshScrollViewDataSourceDidFinishedLoading:(UIScrollView *)scrollView;
- (void)startAnimatingWithScrollView:(UIScrollView *) scrollView;
- (void)setBackgroundColor:(UIColor *)backgroundColor textColor:(UIColor *) textColor arrowImage:(UIImage *) arrowImage;


@end

@protocol CEGORefreshTableHeaderDelegate
- (void)egoRefreshTableHeaderDidTriggerRefresh:(CEGORefreshTableHeaderView*)view;
@optional
- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(CEGORefreshTableHeaderView*)view;

@end