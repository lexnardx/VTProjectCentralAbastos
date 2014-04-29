//
//  JMProduct.m
//  VintecCEDA
//
//  Created by leonardo on 4/28/14.
//  Copyright (c) 2014 Vintec. All rights reserved.
//

#import "JMProduct.h"

@implementation JMProduct


+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"categoria_id": @"categoryId",
                                                       @"icono": @"iconBase64",
                                                       @"id": @"identifier",
                                                       @"nombre": @"name",
                                                       @"tipo_id": @"typeId",
                                                       @"unidad": @"unit",
                                                       }];
}

@end
