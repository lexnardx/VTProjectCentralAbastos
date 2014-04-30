//
//  AppDelegate.h
//  VintecCEDA
//
//  Created by leonardo orihuela on 4/28/14.
//  Copyright (c) 2014 Vintec. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VTSplashScreenViewController.h"


@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    VTSplashScreenViewController *splashScreen;
    
}

@property (strong, nonatomic) UIWindow *window;

@end
