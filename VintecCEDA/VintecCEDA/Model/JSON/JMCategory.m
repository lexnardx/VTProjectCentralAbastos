//
//  JMCategory.m
//  VintecCEDA
//
//  Created by leonardo on 4/28/14.
//  Copyright (c) 2014 Vintec. All rights reserved.
//

#import "JMCategory.h"
#import "NSData+Base64.h"
#import "Util.h"

@implementation JMCategory

+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}

+(JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"id": @"identifier",
                                                       @"icono": @"iconBase64",
                                                       @"nombre": @"name"
                                                       }];
}

+(JMCategory *)jMCategoryFromCategoryObject:(CDCategory *)category
{
    JMCategory *jmcategory = [[JMCategory alloc] init];
    
    if (!category) {
        return jmcategory;
    }
    

    
    jmcategory.identifier = [category.identifier integerValue];
    jmcategory.iconBase64 = category.icon;
    jmcategory.name = category.name;
    
    
    return jmcategory;
    
    
}



@end
