//
//  VTSplashScreenViewController.m
//  VintecCEDA
//
//  Created by leonardo on 4/29/14.
//  Copyright (c) 2014 Vintec. All rights reserved.
//

#import "VTSplashScreenViewController.h"
#import "CoreDataManager.h"
#import "Section.h"
#import "Util.h"


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
    
    [activityIndicator startAnimating];
    
    
    manager = [[ConnectionManager alloc] init];
    [manager setDelegate:self];
    
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    if ([Util wasCoreDataSavedSuccessfully]) {
        [manager checkUpdates];
        [status setText:@"Buscando actualizaciones..."];
    }else{
        [manager fetchGeneralInfo];
        [status setText:@"Descargando información..."];
    }
    
    
    // Do any additional setup after loading the view from its nib.
}

#pragma mark - ConnectionManager Delegate

-(void)connectionManager:(ConnectionManager *)connectionManager didFetchData:(NSData *)data
{
    switch (connectionManager.connectionType) {
        case VTConnectionTypeInstall:
            
            generalInfo = [JSONParserManager parseGeneralInfo:data];
            [[CoreDataManager sharedInstance] insertOrUpdateGeneralInfo:generalInfo];
            
            break;

        case VTConnectionTypeCheckUpdate:
        {
            BOOL updatesAvailable = NO;
            
            NSDictionary *updates = [JSONParserManager parseLastUpdates:data];
         
            if (updates) {
                
            }
            
            if (updatesAvailable) {
                
            }else{
                [self presentTabBarController];
            }
        }
            break;

        case VTConnectionTypeUpdatePrices:
            
            break;

        case VTConnectionTypeUpdateInformation:
            
            break;

        default:
            break;
    }
    
    
    
}

-(void)connectionManager:(ConnectionManager *)connectionManager didResponseError:(NSError *)error
{
    switch (connectionManager.connectionType) {
        case VTConnectionTypeInstall:
            
            break;
            
        case VTConnectionTypeCheckUpdate:
            
            break;
            
        case VTConnectionTypeUpdatePrices:
            
            break;
            
        case VTConnectionTypeUpdate:
            
            break;
            
        default:
            break;
    }

}

-(void)adjustViewForiPhoneSize
{
    
}

-(void)presentTabBarController
{
    tabBarController = [[VTTabBarViewController alloc] initWithNibName:@"VTTabBarViewController" bundle:nil];
    tableController = [[VTTableViewController alloc] initWithNibName:@"VTTableViewController" bundle:nil];
    mapController = [[VTMapViewController alloc] initWithNibName:@"VTMapViewController" bundle:nil];
    
    NSArray *jmsections = [self sections];

    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:tableController];
    
    UITabBarItem *item1 = [[UITabBarItem alloc] initWithTitle:@"Directiorio" image:[UIImage imageNamed:@"Bookmarks"] tag:0];
    UITabBarItem *item2 = [[UITabBarItem alloc] initWithTitle:@"Mapa" image:[UIImage imageNamed:@"Location"] tag:1];
    
    NSMutableArray *tabBarItems = [[NSMutableArray alloc] initWithObjects:item1,item2, nil];
    
    NSMutableArray *viewControllers = [[NSMutableArray alloc] initWithObjects:navController,mapController, nil];
    
    for (JMSections *section in jmsections) {
        
        UIImage *ret = nil;
        
        if (section.iconBase64) {
            
            //ret = [UIImage imageNamed:@"Bookmarks"];
            NSData *imageData = [[NSData alloc] initWithBase64EncodedString:section.iconBase64 options:0];
            ret = [UIImage imageWithData:imageData];

        }
        
        VTInfoViewController *infoController = [[VTInfoViewController alloc] initWithNibName:@"VTInfoViewController" bundle:nil];
        [infoController setSection:section];
        
        [viewControllers addObject:infoController];
        
        UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:section.name image:ret tag:[tabBarItems count]];
        
        [tabBarItems addObject:item];
        
    }
    
    [tabBarController setTabBarItems:tabBarItems];
    [tabBarController setViewControllers:viewControllers animated:YES];
    
    
    
    
    [self presentViewController:tabBarController animated:YES completion:nil];
}

-(NSArray *)sections
{
    
    NSArray *sections = [[CoreDataManager sharedInstance] fetchRowsWithFeature:VTFeatureSection];
    
    NSMutableArray *jmsections = [[NSMutableArray alloc] init];
    
    for (Section *section in sections) {
        JMSections *jmsection = [JMSections jMSectionFromSectionObject:section];
        [jmsections addObject:jmsection];
    }
    
    
    return jmsections;
    
}


-(BOOL)pricesUpdateAvailableInDate:(NSData *)data
{
    
}

-(BOOL)informationUpdateAvailableInDate:(NSData *)data
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
