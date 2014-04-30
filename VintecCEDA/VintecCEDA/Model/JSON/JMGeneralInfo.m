//
//  GeneralInfo.m
//  VintecCEDA
//
//  Created by leonardo on 4/28/14.
//  Copyright (c) 2014 Vintec. All rights reserved.
//

#import "JMGeneralInfo.h"

@implementation JMGeneralInfo

+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}

+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"categorias": @"categories",
                                                       @"elementosInteres": @"interestingPlaces",
                                                       @"locales": @"locales",
                                                       @"productos": @"products",
                                                       @"resumen": @"summary",
                                                       @"secciones": @"sections",
                                                       @"tipos": @"types"
                                                       }];
}

@end
