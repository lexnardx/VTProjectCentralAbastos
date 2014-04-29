//
//  ConnecionManager.h
//  VintecCEDA
//
//  Created by leonardo on 4/28/14.
//  Copyright (c) 2014 Vintec. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ConnecionManager;

@protocol ConnectionManagerDelegate <NSObject>

-(void)connectionManager:(ConnecionManager *)connectionManager didFetchData:(NSData *)data;
-(void)connectionManager:(ConnecionManager *)connectionManager didResponseError:(NSError *)error;

@end

@interface ConnecionManager : NSObject



@property (nonatomic, strong) id <ConnectionManagerDelegate> delegate;

-(void)fetchGeneralInfo;
-(void)fetchInfoUpdatesInDate:(NSDate *)date;
-(void)fetchPriceUpdates;
-(void)checkUpdates;

@end
