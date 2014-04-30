//
//  VTSplashScreenViewController.h
//  VintecCEDA
//
//  Created by leonardo on 4/29/14.
//  Copyright (c) 2014 Vintec. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConnectionManager.h"
#import "JSONParserManager.h"
#import "JMGeneralInfo.h"


@interface VTSplashScreenViewController : UIViewController<ConnectionManagerDelegate>
{
    UIImageView *background;
    UIActivityIndicatorView *activityIndicator;
    ConnectionManager *manager;
    JMGeneralInfo *generalInfo;
}

@end
