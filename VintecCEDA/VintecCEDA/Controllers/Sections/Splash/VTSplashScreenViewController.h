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
#import "VTTableViewController.h"
#import "VTMapViewController.h"
#import "VTInfoViewController.h"
#import "VTTabBarViewController.h"


@interface VTSplashScreenViewController : UIViewController<ConnectionManagerDelegate>
{
    IBOutlet UIImageView *background;
    IBOutlet UIActivityIndicatorView *activityIndicator;
    IBOutlet UILabel *status;
    ConnectionManager *manager;
    JMGeneralInfo *generalInfo;
    
    VTTabBarViewController *tabBarController;
    VTTableViewController *tableController;
    VTMapViewController *mapController;
   
    
}

@end
