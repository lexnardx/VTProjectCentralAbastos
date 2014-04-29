//
//  JMSections.m
//  VintecCEDA
//
//  Created by leonardo on 4/28/14.
//  Copyright (c) 2014 Vintec. All rights reserved.
//

#import "JMSections.h"

@implementation JMSections

+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"icono": @"iconBase64",
                                                       @"id": @"identifier",
                                                       @"imagen": @"imageBase64",
                                                       @"nombre": @"name",
                                                       @"orden": @"index",
                                                       @"texto": @"text"
                                                       }];
}

@end
