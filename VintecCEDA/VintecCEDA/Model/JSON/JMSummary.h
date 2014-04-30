//
//  JMSummary.h
//  VintecCEDA
//
//  Created by leonardo on 4/28/14.
//  Copyright (c) 2014 Vintec. All rights reserved.
//

#import "JSONModel.h"


@protocol JMSummary
@end

@interface JMSummary : JSONModel


@property(nonatomic) NSInteger categories;
@property(nonatomic) NSInteger errorCode;
@property(nonatomic) NSInteger interestingPlaces;
@property(nonatomic) BOOL success;
@property(nonatomic) NSInteger locales;
@property(nonatomic,strong) NSString *errorMessage;
@property(nonatomic) NSInteger products;
@property(nonatomic) NSInteger sections;
@property(nonatomic) NSInteger types;
@property(nonatomic) NSString *lastUpdateFormat;
@property(nonatomic) NSString *lastUpdate;


@end
