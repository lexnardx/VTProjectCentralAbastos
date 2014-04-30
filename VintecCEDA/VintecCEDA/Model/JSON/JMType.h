//
//  JMType.h
//  VintecCEDA
//
//  Created by leonardo on 4/28/14.
//  Copyright (c) 2014 Vintec. All rights reserved.
//

#import "JSONModel.h"

@protocol JMType
@end

@interface JMType : JSONModel

@property(nonatomic) NSInteger identifier;
@property(nonatomic,strong) NSString *name;

@end
