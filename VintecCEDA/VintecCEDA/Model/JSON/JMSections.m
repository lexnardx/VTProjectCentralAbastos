//
//  JMSections.m
//  VintecCEDA
//
//  Created by leonardo on 4/28/14.
//  Copyright (c) 2014 Vintec. All rights reserved.
//

#import "JMSections.h"


@implementation JMSections

@synthesize icon = _icon;
@synthesize image = _image;

+(BOOL)propertyIsOptional:(NSString*)propertyName
{
    return YES;
}

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

+(JMSections *)jMSectionFromSectionObject:(Section *)section
{
    JMSections *jmsection = [[JMSections alloc]init];
    
    if (!section) {
        return jmsection;
    }
    
    
    
    jmsection.identifier = [section.identifier integerValue];
    jmsection.iconBase64 = section.icon;
    jmsection.imageBase64 = section.image;
    jmsection.name = section.name;
    jmsection.index = [section.order integerValue];
    jmsection.text = section.text;

    
    return jmsection;
    
}

@end
