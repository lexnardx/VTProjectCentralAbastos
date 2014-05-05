//
//  CustomAnnotation.h
//  customMapAnnotation
//
//  Created by Mohith K M on 9/26/11.
//  Copyright 2011 Mokriya  (www.mokriya.com). All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MapKit/MapKit.h"

@interface CustomAnnotation : NSObject <MKAnnotation> {
    
}

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, copy) NSString *title;;
@property (nonatomic, copy) NSString *subtitle;;
@property (nonatomic) double latitude;
@property (nonatomic) double longitude;
@property (nonatomic) NSInteger tag;


@end
