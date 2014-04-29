//
//  JMSummary.m
//  VintecCEDA
//
//  Created by leonardo on 4/28/14.
//  Copyright (c) 2014 Vintec. All rights reserved.
//

#import "JMSummary.h"

@implementation JMSummary


+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"categorias": @"categories",
                                                       @"claveError": @"errorCode",
                                                       @"elementosInteres": @"interestingPlaces",
                                                       @"exito": @"success",
                                                       @"locales": @"locales",
                                                       @"mensajeError": @"errorMessage",
                                                       @"productos": @"products",
                                                       @"secciones": @"sections",
                                                       @"tipos": @"types",
                                                       @"ultimaActualizacion": @"lastUpdateFormat"
                                                       }];
}

@end
