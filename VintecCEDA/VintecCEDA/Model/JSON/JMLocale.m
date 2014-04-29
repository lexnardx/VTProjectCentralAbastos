//
//  JMLocale.m
//  VintecCEDA
//
//  Created by leonardo on 4/28/14.
//  Copyright (c) 2014 Vintec. All rights reserved.
//

#import "JMLocale.h"

@implementation JMLocale

+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"id": @"identifier",
                                                       @"latitud": @"latitude",
                                                       @"longitud": @"longitude",
                                                       @"numero": @"number",
                                                       @"pasillo": @"hall",
                                                       @"subdivision": @"subdivision",
                                                       }];
}

@end
