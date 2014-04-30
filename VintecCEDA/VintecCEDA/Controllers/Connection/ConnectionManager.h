//
//  ConnecionManager.h
//  VintecCEDA
//
//  Created by leonardo on 4/28/14.
//  Copyright (c) 2014 Vintec. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ConnectionManager;

@protocol ConnectionManagerDelegate <NSObject>

-(void)connectionManager:(ConnectionManager *)connectionManager didFetchData:(NSData *)data;
-(void)connectionManager:(ConnectionManager *)connectionManager didResponseError:(NSError *)error;

@end

@interface ConnectionManager : NSObject



@property (nonatomic, strong) id <ConnectionManagerDelegate> delegate;

-(void)fetchGeneralInfo;
-(void)fetchInfoUpdatesInDate:(NSDate *)date;
-(void)fetchPriceUpdates;
-(void)checkUpdates;

@end
