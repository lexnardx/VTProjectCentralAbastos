//
//  JSONParserManager.h
//  VintecCEDA
//
//  Created by leonardo on 4/28/14.
//  Copyright (c) 2014 Vintec. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSONParserManager : NSObject

+(NSMutableArray *)parseGeneralInfo:(NSData *)data;
+(NSDictionary *)parseLastUpdates:(NSData *)data;

@end
