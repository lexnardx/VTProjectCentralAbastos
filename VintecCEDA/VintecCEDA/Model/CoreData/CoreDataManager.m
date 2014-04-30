//
//  CoreDataManager.m
//  VintecCEDA
//
//  Created by leonardo on 4/29/14.
//  Copyright (c) 2014 Vintec. All rights reserved.
//

#import "CoreDataManager.h"
#import <CoreData/CoreData.h>


static CoreDataManager *sharedInstance;

@implementation CoreDataManager






-(id)sharedInstance
{
    if (!sharedInstance) {
        sharedInstance = [[CoreDataManager alloc] init];
    }
    
    return sharedInstance;
}

- (NSManagedObjectContext *) managedObjectContext {
    
    if (managedObjectContext != nil) {
        return managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    
    if (coordinator != nil) {
        managedObjectContext = [[NSManagedObjectContext alloc] init];
        [managedObjectContext setPersistentStoreCoordinator: coordinator];
    }
    return managedObjectContext;
    
}

- (NSManagedObjectModel *)managedObjectModel {
    
    if (managedObjectModel != nil) {
        return managedObjectModel;
    }
    managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    return managedObjectModel;
    
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    
    if (persistentCoordinator != nil) {
        return persistentCoordinator;
    }
    NSURL *storeUrl = [NSURL fileURLWithPath: [[self applicationDocumentsDirectory]
                                               stringByAppendingPathComponent: @"CEDA.sqlite"]];
    
    NSError *error = nil;
    
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
    						 [NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption,
    						 [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
    
    persistentCoordinator = [[NSPersistentStoreCoordinator alloc]
                                   initWithManagedObjectModel:[self managedObjectModel]];
    
    if(![persistentCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                  configuration:nil URL:storeUrl options:options error:&error]) {
        /*Error for store creation should be handled in here*/
        NSLog(@"Error PersistentStoreCoordinator %@",[error localizedDescription]);
        
    }
    
    return persistentCoordinator;
    
}
- (NSString *)applicationDocumentsDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

@end
