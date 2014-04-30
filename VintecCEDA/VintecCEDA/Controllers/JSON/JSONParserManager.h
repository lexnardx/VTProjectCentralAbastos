//
//  JSONParserManager.h
//  VintecCEDA
//
//  Created by leonardo on 4/28/14.
//  Copyright (c) 2014 Vintec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JMGeneralInfo.h"

@interface JSONParserManager : NSObject

+(JMGeneralInfo *)parseGeneralInfo:(NSData *)data;
+(NSDictionary *)parseLastUpdates:(NSData *)data;

@end
