//
//  VTMapViewController.m
//  VintecCEDA
//
//  Created by leonardo on 4/29/14.
//  Copyright (c) 2014 Vintec. All rights reserved.
//

#import "VTMapViewController.h"
#import "CustomAnnotation.h"
#import "CoreDataManager.h"
#import "JMInterestingPlace.h"
#import "Place.h"
#import "Location.h"
#import "NSData+Base64.h"

// pad our map by 10% around the farthest annotations
#define MAP_PADDING 1.1

// we'll make sure that our minimum vertical span is about a kilometer
// there are ~111km to a degree of latitude. regionThatFits will take care of
// longitude, which is more complicated, anyway.
#define MINIMUM_VISIBLE_LATITUDE 0.01
#define CEDA_LOCATION CLLocationCoordinate2DMake(  19.374959, -99.090777)

@interface VTMapViewController ()

@end

@implementation VTMapViewController

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
    [self loadAnnotations];
    // Do any additional setup after loading the view from its nib.
}

-(void)viewDidAppear:(BOOL)animated
{
    [self moveMapAreaToCEDA];
    
}

-(void)moveMapAreaToCEDA
{
    MKCoordinateSpan span;
    span.latitudeDelta = 0.015;
    span.longitudeDelta = 0.015;
    MKCoordinateRegion region;
    region.center = CEDA_LOCATION;
    region.span = span;
    [mapView setRegion:region animated:TRUE];
}

-(void)loadAnnotations
{
    annotations = [[NSMutableArray alloc] init];
    
    NSArray *places = [[CoreDataManager sharedInstance] fetchRowsWithFeature:VTFeaturePlace];
    
    for (Place *place in places) {
        for (Location *location in place.location) {
            CustomAnnotation *annotation = [[CustomAnnotation alloc] init];
            annotation.title = place.name;
            annotation.tag = [place.identifier integerValue];
            annotation.latitude = [location.latitude doubleValue];
            annotation.longitude = [location.longitude doubleValue];
            
            [annotations addObject:annotation];
        }
    }
    
    [mapView addAnnotations:annotations];
}

#pragma mark MapView Delegate

/*- (MKAnnotationView *)mapView:(MKMapView *)_mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    
    CustomAnnotation *customAnnotation = (CustomAnnotation *)annotation;
    
    static NSString *defaultPinID = @"customIdentifier";
    
    MKAnnotationView *pinView = (MKAnnotationView *)[_mapView dequeueReusableAnnotationViewWithIdentifier:defaultPinID];
    
    if (pinView == nil){
        pinView = [[MKAnnotationView alloc] initWithAnnotation:customAnnotation reuseIdentifier:defaultPinID];
    }
    
    pinView.centerOffset = CGPointMake(0, -20);
    pinView.opaque = YES;
    pinView.canShowCallout = YES;
    pinView.draggable = YES;
    pinView.annotation = customAnnotation;
    
    [pinView setImage:customAnnotation.image];
    
    CGRect frame = pinView.frame;
    frame.size.width = 50;
    frame.size.height = 70;
    pinView.frame = frame;
    
    
    return pinView;
}*/

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
