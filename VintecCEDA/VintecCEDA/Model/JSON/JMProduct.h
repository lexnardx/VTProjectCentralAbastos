//
//  JMProduct.h
//  VintecCEDA
//
//  Created by leonardo on 4/28/14.
//  Copyright (c) 2014 Vintec. All rights reserved.
//

#import "JSONModel.h"

@protocol JMProduct
@end

@interface JMProduct : JSONModel

@property(nonatomic) NSInteger categoryId;
@property(nonatomic,strong) NSString *iconBase64;
@property(nonatomic,strong) UIImage *icon;
@property(nonatomic) NSInteger identifier;
@property(nonatomic,strong) NSString *name;
@property(nonatomic) NSInteger typeId;
@property(nonatomic) NSString *unit;


@end
