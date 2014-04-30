//
//  JMCategory.h
//  VintecCEDA
//
//  Created by leonardo on 4/28/14.
//  Copyright (c) 2014 Vintec. All rights reserved.
//

#import "JSONModel.h"

@protocol JMCategory
@end

@interface JMCategory : JSONModel

@property(nonatomic) NSInteger identifier;
@property(nonatomic,strong) UIImage *icon;
@property(nonatomic,strong) NSString *iconBase64;
@property(nonatomic,strong) NSString *name;

@end
