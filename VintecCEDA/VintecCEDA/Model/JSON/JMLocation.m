//
//  JMLocation.m
//  VintecCEDA
//
//  Created by leonardo on 4/28/14.
//  Copyright (c) 2014 Vintec. All rights reserved.
//

#import "JMLocation.h"

@implementation JMLocation

+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"id": @"identifier",
                                                       @"latitud": @"latitude",
                                                       @"longitud": @"longitude"
                                                       }];
}

@end
