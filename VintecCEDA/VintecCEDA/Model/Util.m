//
//  Util.m
//  VintecCEDA
//
//  Created by leonardo on 5/2/14.
//  Copyright (c) 2014 Vintec. All rights reserved.
//

#import "Util.h"

#define DB_KEY @"DBKey"
#define INFORMATION_UPDATE @"infoUpdate"
#define PRICES_UPDATE @"priceUpdate"


@implementation Util


+(BOOL)stringIsEmptyOrNull:(NSString *)string
{
    if (string == nil || [[string stringByReplacingOccurrencesOfString:@" " withString:@""] isEqualToString:@""]) {
        return YES;
    }else{
        return NO;
    }
}

+(BOOL)isDigit:(unichar)character
{
    return (character>='0' && character<='9');
}

+(BOOL)isLetter:(unichar)character extendedASCII:(BOOL)extended
{
    if (extended) {
        return ((character>='a' && character<='z') || (character>='A' && character<='Z') || ((int)character >= 192 && (int)character <= 382));
    }else{
        return ((character>='a' && character<='z') || (character>='A' && character<='Z'));
    }
    
}

+(BOOL)isLetterOrNumber:(unichar)character extendedASCII:(BOOL)extended
{
    return ([Util isLetter:character extendedASCII:extended] || [Util isDigit:character]);
}


+(void)coreDataSavedSucessfully
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    [userDefaults setBool:YES forKey:DB_KEY];
    [userDefaults synchronize];
}

+(BOOL)wasCoreDataSavedSuccessfully
{
   return [[NSUserDefaults standardUserDefaults] boolForKey:DB_KEY];
}

+(BOOL)isInformationUpToUpdate
{
    NSDate *date = [[NSUserDefaults standardUserDefaults] objectForKey:INFORMATION_UPDATE];
    
    NSDate *today = [NSDate date];
    
   
    
}

+(void)lastInformationUpdate:(NSString *)stringDate
{
    
    NSDate *date = [Util dateFromString:stringDate];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    [userDefaults setObject:date forKey:INFORMATION_UPDATE];
    [userDefaults synchronize];

}

+(BOOL)isPricesUpToUpdate
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:PRICES_UPDATE];
}

+(void)lastPricesUpdate:(NSString *)stringDate
{
    NSDate *date = [Util dateFromString:stringDate];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    [userDefaults setObject:date forKey:PRICES_UPDATE];
    [userDefaults synchronize];
    
}

+(NSDate *)dateFromString:(NSString *)stringDate
{
    if ([Util stringIsEmptyOrNull:stringDate]) {
        return nil;
    }
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    return [formatter dateFromString:stringDate];
}


@end
