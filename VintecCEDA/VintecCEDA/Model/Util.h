//
//  Util.h
//  VintecCEDA
//
//  Created by leonardo on 5/2/14.
//  Copyright (c) 2014 Vintec. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Util : NSObject

+(BOOL)stringIsEmptyOrNull:(NSString *)string;
+(BOOL)isDigit:(unichar)character;
+(BOOL)isLetter:(unichar)character extendedASCII:(BOOL)extended;
+(BOOL)isLetterOrNumber:(unichar)character extendedASCII:(BOOL)extended;
+(void)coreDataSavedSucessfully;
+(BOOL)wasCoreDataSavedSuccessfully;
+(NSDate *)lastInformationUpdate;
+(void)lastInformationUpdate:(NSString *)stringDate;
+(NSDate *)lastPricesUpdate;
+(void)lastPricesUpdate:(NSString *)stringDate;
+(NSDate *)dateFromString:(NSString *)stringDate;

@end
