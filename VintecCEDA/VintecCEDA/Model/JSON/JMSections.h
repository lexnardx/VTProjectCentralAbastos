//
//  JMSections.h
//  VintecCEDA
//
//  Created by leonardo on 4/28/14.
//  Copyright (c) 2014 Vintec. All rights reserved.
//

#import "JSONModel.h"

@interface JMSections : JSONModel

@property(nonatomic) NSInteger identifier;
@property(nonatomic,strong) NSString *iconBase64;
@property(nonatomic,strong) NSString *imageBase64;
@property(nonatomic,strong) UIImage *image;
@property(nonatomic,strong) UIImage *icon;
@property(nonatomic,strong) NSString *name;
@property(nonatomic) NSInteger index;
@property(nonatomic,strong) NSString *text;


@end
