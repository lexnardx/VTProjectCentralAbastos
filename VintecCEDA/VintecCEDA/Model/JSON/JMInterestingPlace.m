//
//  InterestingPlace.m
//  VintecCEDA
//
//  Created by leonardo on 4/28/14.
//  Copyright (c) 2014 Vintec. All rights reserved.
//

#import "JMInterestingPlace.h"

@implementation JMInterestingPlace

+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}

+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"id": @"identifier",
                                                       @"nombre": @"name",
                                                       @"ubicaciones": @"locations"
                                                       }];
}

@end
