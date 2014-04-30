//
//  Category.h
//  VintecCEDA
//
//  Created by leonardo orihuela on 4/30/14.
//  Copyright (c) 2014 Vintec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface CDCategory : NSManagedObject

@property (nonatomic, retain) NSString * icon;
@property (nonatomic, retain) NSNumber * identifier;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *prduct;
@end

@interface CDCategory (CoreDataGeneratedAccessors)

- (void)addPrductObject:(NSManagedObject *)value;
- (void)removePrductObject:(NSManagedObject *)value;
- (void)addPrduct:(NSSet *)values;
- (void)removePrduct:(NSSet *)values;

@end