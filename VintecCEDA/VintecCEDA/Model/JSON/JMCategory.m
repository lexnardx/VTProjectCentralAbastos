//
//  JMCategory.m
//  VintecCEDA
//
//  Created by leonardo on 4/28/14.
//  Copyright (c) 2014 Vintec. All rights reserved.
//

#import "JMCategory.h"

@implementation JMCategory


+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"id": @"identifier",
                                                       @"icono": @"iconBase64",
                                                       @"nombre": @"name"
                                                       }];
}


@end
