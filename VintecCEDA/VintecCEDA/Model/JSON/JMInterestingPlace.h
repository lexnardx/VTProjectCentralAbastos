//
//  InterestingPlace.h
//  VintecCEDA
//
//  Created by leonardo on 4/28/14.
//  Copyright (c) 2014 Vintec. All rights reserved.
//

#import "JSONModel.h"
#import "JMLocation.h"

@protocol JMInterestingPlace
@end

@interface JMInterestingPlace : JSONModel


@property(nonatomic) NSInteger identifier;
@property(nonatomic,strong) NSString *name;
@property(nonatomic,strong) NSArray <JMLocation>*locations;

@end
