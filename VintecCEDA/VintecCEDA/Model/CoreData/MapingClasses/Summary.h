//
//  Summary.h
//  VintecCEDA
//
//  Created by leonardo orihuela on 4/30/14.
//  Copyright (c) 2014 Vintec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Summary : NSManagedObject

@property (nonatomic, retain) NSNumber * category;
@property (nonatomic, retain) NSNumber * erroCode;
@property (nonatomic, retain) NSString * errorMessage;
@property (nonatomic, retain) NSDate * lastUpdate;
@property (nonatomic, retain) NSNumber * locales;
@property (nonatomic, retain) NSNumber * places;
@property (nonatomic, retain) NSNumber * products;
@property (nonatomic, retain) NSNumber * sections;
@property (nonatomic, retain) NSNumber * success;
@property (nonatomic, retain) NSNumber * types;

@end
