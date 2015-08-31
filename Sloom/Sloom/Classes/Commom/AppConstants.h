//
//  AppConstants.h
//  Zazz
//
//  Created by Cuong Voong Tan Quoc on 8/22/15.
//  Copyright (c) 2015 Quodisys. All rights reserved.
//


#define Storyboard   [UIStoryboard storyboardWithName:@"Main" bundle:nil]
#define UserDefault  [NSUserDefaults standardUserDefaults]
#define DEVICE_SIZE  [[UIScreen mainScreen] bounds].size

//NSNotificationCenter

#define kSelectTagLineVCNotification @""
#define kPromoterTypeVCNotification @""

//UserDefault

#define kAccessToken @"AccessToken"
#define kRefreshToken @"RefreshToken"
#define kTokenType @"TokenType"
#define kUserID @"UserID"

//API
#define kAPIRootURL @""

#define kAPIAuthorizationBasic @""

#define kAPIRegister                @"register"
#define kAPILogin                   @"token"
#define kAPIGetAllCategories        @"categories"
