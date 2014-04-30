//
//  VTSplashScreenViewController.m
//  VintecCEDA
//
//  Created by leonardo on 4/29/14.
//  Copyright (c) 2014 Vintec. All rights reserved.
//

#import "VTSplashScreenViewController.h"

@interface VTSplashScreenViewController ()

@end

@implementation VTSplashScreenViewController

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
    
    background = [[UIImageView alloc] initWithFrame:self.view.frame];
    
    activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [activityIndicator setFrame:CGRectMake(150, 400, 50, 50)];
    [activityIndicator startAnimating];
    
    manager = [[ConnectionManager alloc] init];
    [manager setDelegate:self];
    [manager fetchGeneralInfo];
    
    
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self.view addSubview:background];
    [self.view addSubview:activityIndicator];
    
    
    // Do any additional setup after loading the view from its nib.
}

#pragma mark - ConnectionManager Delegate

-(void)connectionManager:(ConnectionManager *)connectionManager didFetchData:(NSData *)data
{
    
    generalInfo = [JSONParserManager parseGeneralInfo:data];
    
    
}

-(void)connectionManager:(ConnectionManager *)connectionManager didResponseError:(NSError *)error
{
    
}

-(void)adjustViewForiPhoneSize
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
