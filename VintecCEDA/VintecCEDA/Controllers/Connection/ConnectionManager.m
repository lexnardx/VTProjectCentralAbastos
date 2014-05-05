//
//  ConnecionManager.m
//  VintecCEDA
//
//  Created by leonardo on 4/28/14.
//  Copyright (c) 2014 Vintec. All rights reserved.
//

#import "ConnectionManager.h"

#define URL_GENERAL_INFO @"http://ficeda.com.mx/app_precios/api_mobile/install"
#define URL_UPDATE_INFO @"http://ficeda.com.mx/app_precios/api_mobile/download_updates?fechaActualizacion="
#define URL_UPDATE_PRICES @"http://ficeda.com.mx/app_precios/api_mobile/download_prices"
#define URL_CHECK_UPDATES @"http://ficeda.com.mx/app_precios/api_mobile/last_updated"

@interface ConnectionManager()

@property (nonatomic, strong) NSURLConnection *connection;
@property (nonatomic, strong) NSMutableData *responseData;

@end

@implementation ConnectionManager

@synthesize delegate;
@synthesize connectionType;

-(void)fetchGeneralInfo
{
    if (self.connection) {
        [self.connection cancel];
    }
    
    connectionType = VTConnectionTypeInstall;
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URL_GENERAL_INFO]];
    NSMutableDictionary *headers = [NSMutableDictionary dictionary];
    [headers setObject:@"iPhone" forKey:@"User-Agent"];
    [headers setObject:@"application/json" forKey:@"Accept"];
    [headers setObject:@"application/json" forKey:@"Content-Type"];
    
    [request setAllHTTPHeaderFields:headers];
    
    self.responseData = [[NSMutableData alloc] init];
    self.connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
}

-(void)fetchInfoUpdatesInDate:(NSDate *)date
{
    if (self.connection) {
        [self.connection cancel];
    }
    
    connectionType = VTConnectionTypeUpdate;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSString *dateFormat = [[dateFormatter stringFromDate:date] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSString *url = [[NSString alloc] initWithFormat:@"%@%@",URL_UPDATE_INFO,dateFormat];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
    NSMutableDictionary *headers = [NSMutableDictionary dictionary];
    [headers setObject:@"iPhone" forKey:@"User-Agent"];
    [headers setObject:@"application/json" forKey:@"Accept"];
    [headers setObject:@"application/json" forKey:@"Content-Type"];
    
    [request setAllHTTPHeaderFields:headers];
    
    self.responseData = [[NSMutableData alloc] init];
    self.connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
}

-(void)fetchPriceUpdates
{
    if (self.connection) {
        [self.connection cancel];
    }
    
    connectionType = VTConnectionTypeUpdatePrices;
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URL_UPDATE_PRICES]];
    NSMutableDictionary *headers = [NSMutableDictionary dictionary];
    [headers setObject:@"iPhone" forKey:@"User-Agent"];
    [headers setObject:@"application/json" forKey:@"Accept"];
    [headers setObject:@"application/json" forKey:@"Content-Type"];
    
    [request setAllHTTPHeaderFields:headers];
    
    self.responseData = [[NSMutableData alloc] init];
    self.connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
}

-(void)checkUpdates
{
    if (self.connection) {
        [self.connection cancel];
    }
    
    connectionType = VTConnectionTypeCheckUpdate;
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URL_CHECK_UPDATES]];
    NSMutableDictionary *headers = [NSMutableDictionary dictionary];
    [headers setObject:@"iPhone" forKey:@"User-Agent"];
    [headers setObject:@"application/json" forKey:@"Accept"];
    [headers setObject:@"application/json" forKey:@"Content-Type"];
    
    [request setAllHTTPHeaderFields:headers];
    
    self.responseData = [[NSMutableData alloc] init];
    self.connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
}


- (void)connection:(NSURLConnection *)aConnection didReceiveResponse:(NSURLResponse *)response {
    [self.responseData setLength:0];
}

- (void)connection:(NSURLConnection *)aConnection didReceiveData:(NSData *)data {
    [self.responseData appendData:data];
}

- (void)connection:(NSURLConnection *)aConnection didFailWithError:(NSError *)error {
    NSLog(@"Download error");
    if (delegate) {
        [delegate connectionManager:self didResponseError:error];
    }
}

- (void)connectionDidFinishLoading:(NSURLConnection *)aConnection {
    NSLog(@"Download successful");
    if (delegate) {
        [delegate connectionManager:self didFetchData:self.responseData];
    }
}


@end
