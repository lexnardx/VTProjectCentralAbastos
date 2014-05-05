//
//  CoreDataManager.h
//  VintecCEDA
//
//  Created by leonardo on 4/29/14.
//  Copyright (c) 2014 Vintec. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JMGeneralInfo.h"


enum VTFeature : NSUInteger {
    VTFeatureCategory,
    VTFeatureLocale,
    VTFeatureLocation,
    VTFeaturePlace,
    VTFeatureProduct,
    VTFeatureSection,
    VTFeatureSummary,
    VTFeatureType,
};


@interface CoreDataManager : NSObject
{
    
}

@property (nonatomic,strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic,strong) NSManagedObjectModel *managedObjectModel;
@property (nonatomic,strong) NSPersistentStoreCoordinator *persistentCoordinator;

+(id)sharedInstance;

-(void)insertOrUpdateGeneralInfo:(JMGeneralInfo *)generalInfo;
-(NSArray *)fetchRowsWithFeature:(enum VTFeature)section;


@end
