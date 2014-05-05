//
//  VTMapViewController.h
//  VintecCEDA
//
//  Created by leonardo on 4/29/14.
//  Copyright (c) 2014 Vintec. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface VTMapViewController : UIViewController
{
    
    IBOutlet MKMapView *mapView;
    NSMutableArray *annotations;
}


@end
