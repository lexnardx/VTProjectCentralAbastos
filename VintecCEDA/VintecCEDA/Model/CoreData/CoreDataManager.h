//
//  CoreDataManager.h
//  VintecCEDA
//
//  Created by leonardo on 4/29/14.
//  Copyright (c) 2014 Vintec. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoreDataManager : NSObject
{
    NSManagedObjectContext *managedObjectContext;
    NSManagedObjectModel *managedObjectModel;
    NSPersistentStoreCoordinator *persistentCoordinator;
}


-(id)sharedInstance;



@end
