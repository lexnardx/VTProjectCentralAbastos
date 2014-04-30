//
//  Product.h
//  VintecCEDA
//
//  Created by leonardo orihuela on 4/30/14.
//  Copyright (c) 2014 Vintec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class CDCategory;

@interface Product : NSManagedObject

@property (nonatomic, retain) NSString * icon;
@property (nonatomic, retain) NSNumber * identifier;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * type;
@property (nonatomic, retain) NSString * unit;
@property (nonatomic, retain) NSNumber * categoryId;

@end
