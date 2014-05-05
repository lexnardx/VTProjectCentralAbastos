//
//  VTTabBarViewController.m
//  VintecCEDA
//
//  Created by leonardo on 4/29/14.
//  Copyright (c) 2014 Vintec. All rights reserved.
//

#import "VTTabBarViewController.h"
#import "UIUtil.h"

@interface VTTabBarViewController ()

@end

@implementation VTTabBarViewController

@synthesize tabBarItems;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tabBar setTranslucent:YES];
    [self.tabBar setTintColor:COLOR_PURPLE];

    // Do any additional setup after loading the view from its nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    
    for (int i=0; i< [self.tabBar.items count]; i++) {
        UITabBarItem *item = [tabBarItems objectAtIndex:i];
        
        if ([item.title length]>13) {
            item.title = [NSString stringWithFormat:@"%@...", [item.title substringToIndex:13]];
        }
        
        [[self.tabBar.items objectAtIndex:i] setTitle:item.title];
        [((UITabBarItem *)[self.tabBar.items objectAtIndex:i]) setImage:item.image];
        
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
