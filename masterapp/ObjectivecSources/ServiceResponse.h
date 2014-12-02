//
//  ServiceResponse.h
//  masterapp
//
//  Created by Mykola Denysyuk on 12/1/14.
//  Copyright (c) 2014 scimedmedia. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RKObjectMapping, RKResponseDescriptor;

@interface ServiceResponse : NSObject

@property (strong) id returnedValue;
@property (assign) int resultCode;
@property (strong) NSString * resultDescription;
@property (strong) NSString * errorMessage;

+ (RKObjectMapping *)objectMapping;
+ (RKObjectMapping *)objectMappingForClass:(Class )objClass pathPatter:(NSString *)pathPattern fromKeyPath:(NSString *)keyPath;
+ (RKResponseDescriptor *)responseDescriptorForClass:(Class )objClass pathPatter:(NSString *)pathPattern fromKeyPath:(NSString *)keyPath;

@end
