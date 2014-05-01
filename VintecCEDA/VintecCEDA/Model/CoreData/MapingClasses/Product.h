//
//  Product.h
//  VintecCEDA
//
//  Created by leonardo on 5/1/14.
//  Copyright (c) 2014 Vintec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Product : NSManagedObject

@property (nonatomic, retain) NSNumber * category;
@property (nonatomic, retain) NSString * icon;
@property (nonatomic, retain) NSNumber * identifier;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * type;
@property (nonatomic, retain) NSString * unit;

@end
