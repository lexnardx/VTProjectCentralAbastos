//
//  JMLocale.h
//  VintecCEDA
//
//  Created by leonardo on 4/28/14.
//  Copyright (c) 2014 Vintec. All rights reserved.
//

#import "JSONModel.h"

@protocol JMLocale
@end

@interface JMLocale : JSONModel

@property(nonatomic) NSInteger identifier;
@property(nonatomic) double latitude;
@property(nonatomic) double longitude;
@property(nonatomic) NSInteger number;
@property(nonatomic) NSString *hall;
@property(nonatomic) NSString *subdivision;

@end
