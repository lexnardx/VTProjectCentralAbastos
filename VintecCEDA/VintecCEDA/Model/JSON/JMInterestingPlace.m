//
//  InterestingPlace.m
//  VintecCEDA
//
//  Created by leonardo on 4/28/14.
//  Copyright (c) 2014 Vintec. All rights reserved.
//

#import "JMInterestingPlace.h"

@implementation JMInterestingPlace

+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"id": @"identifier",
                                                       @"nombre": @"name",
                                                       @"ubicaciones": @"locations"
                                                       }];
}

@end
