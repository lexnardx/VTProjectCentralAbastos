//
//  JMLocation.h
//  VintecCEDA
//
//  Created by leonardo on 4/28/14.
//  Copyright (c) 2014 Vintec. All rights reserved.
//

#import "JSONModel.h"


@protocol JMLocation
@end

@interface JMLocation : JSONModel

@property(nonatomic) NSInteger identifier;
@property(nonatomic) double latitude;
@property(nonatomic) double longitude;


@end
