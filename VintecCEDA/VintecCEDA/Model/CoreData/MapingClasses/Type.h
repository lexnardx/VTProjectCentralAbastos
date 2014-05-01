//
//  Type.h
//  VintecCEDA
//
//  Created by leonardo on 5/1/14.
//  Copyright (c) 2014 Vintec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Type : NSManagedObject

@property (nonatomic, retain) NSNumber * identifier;
@property (nonatomic, retain) NSString * name;

@end
