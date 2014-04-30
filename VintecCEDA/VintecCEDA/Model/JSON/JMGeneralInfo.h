//
//  GeneralInfo.h
//  VintecCEDA
//
//  Created by leonardo on 4/28/14.
//  Copyright (c) 2014 Vintec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import "JMCategory.h"
#import "JMInterestingPlace.h"
#import "JMLocale.h"
#import "JMProduct.h"
#import "JMSummary.h"
#import "JMSections.h"
#import "JMType.h"


@interface JMGeneralInfo : JSONModel

@property(nonatomic,strong) NSArray <JMCategory>*categories;
@property(nonatomic,strong) NSArray <JMInterestingPlace>*interestingPlaces;
@property(nonatomic,strong) NSArray <JMLocale>*locales;
@property(nonatomic,strong) NSArray <JMProduct>*products;
@property(nonatomic,strong) JMSummary *summary;
@property(nonatomic,strong) NSArray <JMSections>*sections;
@property(nonatomic,strong) NSArray <JMType>*types;

@end
