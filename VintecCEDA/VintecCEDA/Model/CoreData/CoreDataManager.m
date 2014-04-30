//
//  CoreDataManager.m
//  VintecCEDA
//
//  Created by leonardo on 4/29/14.
//  Copyright (c) 2014 Vintec. All rights reserved.
//

#import "CoreDataManager.h"
#import <CoreData/CoreData.h>
#import "JMSections.h"
#import "Section.h"
#import "JMCategory.h"
#import "CDCategory.h"
#import "JMType.h"
#import "Type.h"
#import "JMSummary.h"
#import "Summary.h"
#import "Product.h"
#import "JMProduct.h"
#import "Locale.h"
#import "JMLocale.h"
#import "JMLocation.h"
#import "Location.h"
#import "JMInterestingPlace.h"
#import "Place.h"

static CoreDataManager *sharedInstance;

@implementation CoreDataManager


#pragma mark - InsertOrUpdate

-(void)insertOrUpdateSection:(JMSections *)section
{
    Section *entry = nil;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Section" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Specify criteria for filtering which objects to fetch
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"identifier == %@", [NSNumber numberWithInteger:section.identifier]];
    [fetchRequest setPredicate:predicate];
    // Specify how the fetched objects should be sorted
    
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (fetchedObjects == nil) {
        entry = [NSEntityDescription insertNewObjectForEntityForName:@"Section" inManagedObjectContext:self.managedObjectContext];
    }else{
        entry = [fetchedObjects lastObject];
    }
    
    entry.identifier = [NSNumber numberWithInteger:section.identifier];
    entry.icon = section.iconBase64;
    entry.image = section.imageBase64;
    entry.name = section.name;
    entry.order = [NSNumber numberWithInteger:section.index];
    entry.text = section.text;
    
    
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Couldn't save section: %@", [error localizedDescription]);
    }
    
}

-(void)insertOrUpdateCategory:(JMCategory *)category
{
    CDCategory *entry = nil;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Category" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Specify criteria for filtering which objects to fetch
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"identifier == %@", [NSNumber numberWithInteger:category.identifier]];
    [fetchRequest setPredicate:predicate];
    // Specify how the fetched objects should be sorted
    
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (fetchedObjects == nil) {
        entry = [NSEntityDescription insertNewObjectForEntityForName:@"Category" inManagedObjectContext:self.managedObjectContext];
        
    }else{
        entry = [fetchedObjects lastObject];
    }
    
    entry.identifier = [NSNumber numberWithInteger:category.identifier];
    entry.icon = category.iconBase64;
    entry.name = category.name;
    
    
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Couldn't save category: %@", [error localizedDescription]);
    }
    
}



-(void)insertOrUpdateType:(JMType *)type
{
    Type *entry = nil;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Type" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Specify criteria for filtering which objects to fetch
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"identifier == %@", [NSNumber numberWithInteger:type.identifier]];
    [fetchRequest setPredicate:predicate];
    // Specify how the fetched objects should be sorted
    
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (fetchedObjects == nil) {
        entry = [NSEntityDescription insertNewObjectForEntityForName:@"Type" inManagedObjectContext:self.managedObjectContext];
    }else{
        entry = [fetchedObjects lastObject];
    }
    
    entry.identifier = [NSNumber numberWithInteger:type.identifier];
    entry.name = type.name;
    
    
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Couldn't save type: %@", [error localizedDescription]);
    }
    
}


-(void)insertOrUpdateSummary:(JMSummary *)summary
{
    Summary *entry = nil;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Summary" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (fetchedObjects == nil) {
        entry = [NSEntityDescription insertNewObjectForEntityForName:@"Summary" inManagedObjectContext:self.managedObjectContext];
    }else{
        entry = [fetchedObjects lastObject];
    }
    
    entry.category = [NSNumber numberWithInteger:summary.categories];
    entry.erroCode = [NSNumber numberWithInteger:summary.errorCode];
    entry.places = [NSNumber numberWithInteger:summary.interestingPlaces];
    entry.success = [NSNumber numberWithBool:summary.success];
    entry.locales = [NSNumber numberWithInteger:summary.locales];
    entry.errorMessage = summary.errorMessage;
    entry.products = [NSNumber numberWithInteger:summary.products];
    entry.sections = [NSNumber numberWithInteger:summary.sections];
    entry.types = [NSNumber numberWithInteger:summary.types];
    entry.lastUpdate = summary.lastUpdate;
    
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Couldn't save type: %@", [error localizedDescription]);
    }
    
}

-(void)insertOrUpdateProduct:(JMProduct *)product
{
    Product *entry = nil;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Product" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (fetchedObjects == nil) {
        entry = [NSEntityDescription insertNewObjectForEntityForName:@"Product" inManagedObjectContext:self.managedObjectContext];
    }else{
        entry = [fetchedObjects lastObject];
    }
    
    entry.identifier = [NSNumber numberWithInteger:product.identifier];
    entry.icon = product.iconBase64;
    entry.name = product.name;
    entry.type = [NSNumber numberWithInteger:product.typeId];
    entry.unit = product.unit;
    entry.categoryId = [NSNumber numberWithInteger:product.categoryId];
    
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Couldn't save product: %@", [error localizedDescription]);
    }
    
}

-(void)insertOrUpdateLocale:(JMLocale *)locale
{
    Locale *entry = nil;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Locale" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (fetchedObjects == nil) {
        entry = [NSEntityDescription insertNewObjectForEntityForName:@"Locale" inManagedObjectContext:self.managedObjectContext];
    }else{
        entry = [fetchedObjects lastObject];
    }
    
    entry.identifier = [NSNumber numberWithInteger:locale.identifier];
    entry.latitude = [NSNumber numberWithDouble:locale.latitude];
    entry.longitude = [NSNumber numberWithDouble:locale.longitude];
    entry.number = locale.number;
    entry.hall = locale.hall;
    entry.subdivision = locale.subdivision;
    
    
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Couldn't save locale: %@", [error localizedDescription]);
    }
    
}


-(void)insertOrUpdatePlace:(JMInterestingPlace *)place
{
    Place *entry = nil;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Place" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (fetchedObjects == nil) {
        entry = [NSEntityDescription insertNewObjectForEntityForName:@"Place" inManagedObjectContext:self.managedObjectContext];
        
        
        
        for (JMLocation *location in place.locations) {
            Location *locationCoreData = [NSEntityDescription insertNewObjectForEntityForName:@"Location" inManagedObjectContext:self.managedObjectContext];
            
            locationCoreData.identifier = [NSNumber numberWithDouble:location.identifier];
            locationCoreData.latitude = [NSNumber numberWithDouble:location.latitude];
            locationCoreData.longitude = [NSNumber numberWithDouble:location.longitude];
            locationCoreData.place = entry;
            
            [entry addLocationObject:locationCoreData];
        }
        
    }else{
        entry = [fetchedObjects lastObject];
        
        [self addOrUpdatePlace:entry withJSONPlace:place];
    }
    
    entry.identifier = [NSNumber numberWithInteger:place.identifier];
    entry.name = place.name;

    
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Couldn't save location: %@", [error localizedDescription]);
    }
    
}


-(void)addOrUpdatePlace:(Place *)place withJSONPlace:(JMInterestingPlace *)jmPlace
{
    
    for (JMLocation *location  in jmPlace.locations) {
        Location *locationObject = nil;
        
        for (Location *aux in place.location) {
            if ([locationObject.identifier isEqualToNumber:aux.identifier]) {
                locationObject = aux;
            }
        }
        
        
        if (!locationObject) {
            locationObject = [NSEntityDescription insertNewObjectForEntityForName:@"Location" inManagedObjectContext:self.managedObjectContext];
        }
        
        locationObject.identifier = [NSNumber numberWithInteger:location.identifier];
        locationObject.latitude = [NSNumber numberWithDouble:location.latitude];
        locationObject.longitude = [NSNumber numberWithDouble:location.longitude];
        locationObject.place = place;
        
        
    }
    
}



-(void)insertOrUpdateLocation:(JMLocation *)location
{
    Location *entry = nil;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Location" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (fetchedObjects == nil) {
        entry = [NSEntityDescription insertNewObjectForEntityForName:@"Location" inManagedObjectContext:self.managedObjectContext];
    }else{
        entry = [fetchedObjects lastObject];
    }
    
    entry.identifier = [NSNumber numberWithInteger:location.identifier];
    entry.latitude = [NSNumber numberWithDouble:location.latitude];
    entry.longitude = [NSNumber numberWithDouble:location.longitude];
    
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Couldn't save location: %@", [error localizedDescription]);
    }
    
}

#pragma mark - CoreData Initialization

+(id)sharedInstance
{
    if (!sharedInstance) {
        sharedInstance = [[CoreDataManager alloc] init];
    }
    
    return sharedInstance;
}

- (NSManagedObjectContext *) managedObjectContext {
    
    if (self.managedObjectContext != nil) {
        return self.managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    
    if (coordinator != nil) {
        self.managedObjectContext = [[NSManagedObjectContext alloc] init];
        [self.managedObjectContext setPersistentStoreCoordinator: coordinator];
    }
    return self.managedObjectContext;
    
}

- (NSManagedObjectModel *)managedObjectModel {
    
    if (self.managedObjectModel != nil) {
        return self.managedObjectModel;
    }
    self.managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    return self.managedObjectModel;
    
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    
    if (self.persistentCoordinator != nil) {
        return self.persistentCoordinator;
    }
    NSURL *storeUrl = [NSURL fileURLWithPath: [[self applicationDocumentsDirectory]
                                               stringByAppendingPathComponent: @"CEDA.sqlite"]];
    
    NSError *error = nil;
    
    NSDictionary *options = [NSDictionary dictionaryWithObjectsAndKeys:
    						 [NSNumber numberWithBool:YES], NSMigratePersistentStoresAutomaticallyOption,
    						 [NSNumber numberWithBool:YES], NSInferMappingModelAutomaticallyOption, nil];
    
    self.persistentCoordinator = [[NSPersistentStoreCoordinator alloc]
                                   initWithManagedObjectModel:[self managedObjectModel]];
    
    if(![self.persistentCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                  configuration:nil URL:storeUrl options:options error:&error]) {
        /*Error for store creation should be handled in here*/
        NSLog(@"Error PersistentStoreCoordinator %@",[error localizedDescription]);
        
    }
    
    return self.persistentCoordinator;
    
}
- (NSString *)applicationDocumentsDirectory {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
}

@end
