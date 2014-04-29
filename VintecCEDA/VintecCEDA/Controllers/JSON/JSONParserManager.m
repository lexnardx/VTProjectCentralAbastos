//
//  JSONParserManager.m
//  VintecCEDA
//
//  Created by leonardo on 4/28/14.
//  Copyright (c) 2014 Vintec. All rights reserved.
//

#import "JSONParserManager.h"


@implementation JSONParserManager

+(NSMutableArray *)parseGeneralInfo:(NSData *)data
{
    
    
    
}


+(NSDictionary *)parseLastUpdates:(NSData *)data
{
    NSError *error;
    
    NSDictionary *json = (NSDictionary *)[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    return json;
}

@end
