//
//  ServiceResponse.m
//  masterapp
//
//  Created by Mykola Denysyuk on 12/1/14.
//  Copyright (c) 2014 scimedmedia. All rights reserved.
//

#import "ServiceResponse.h"
#import <RestKit/RestKit.h>

@implementation ServiceResponse

+ (RKObjectMapping *)objectMapping
{
    RKObjectMapping * mapping = [RKObjectMapping mappingForClass:self.class];
    [mapping addAttributeMappingsFromDictionary:@{@"ResultCode": @"resultCode",
                                                  @"ResultCodeName": @"resultDescription",
                                                  @"ErrorMessage": @"errorMessage"}];
    return mapping;
}

+ (RKObjectMapping *)objectMappingForClass:(Class )class pathPatter:(NSString *)pathPattern fromKeyPath:(NSString *)keyPath
{
    RKObjectMapping * serviceResponseMapping = [self objectMapping];
    
    RKMapping * objectMapping = ([class respondsToSelector:@selector(objectMapping)]) ? [class objectMapping] : nil;
    
    if(objectMapping) {
        NSString * relationshipKeyPath = [NSString stringWithFormat:@"ReturnValue%@", keyPath?[@"." stringByAppendingString:keyPath]:@""];
        RKRelationshipMapping * relationship = [RKRelationshipMapping relationshipMappingFromKeyPath:relationshipKeyPath
                                                                                           toKeyPath:@"returnedValue"
                                                                                         withMapping:objectMapping];
        
        [serviceResponseMapping addPropertyMapping:relationship];
    }
    
    return serviceResponseMapping;
}

+ (RKResponseDescriptor *)responseDescriptorForClass:(Class )class pathPatter:(NSString *)pathPattern fromKeyPath:(NSString *)keyPath;
{
    
    RKObjectMapping * serviceResponseMapping = [self objectMappingForClass:class
                                                                pathPatter:pathPattern
                                                               fromKeyPath:keyPath];
    
    RKResponseDescriptor * descriptor = [RKResponseDescriptor responseDescriptorWithMapping:serviceResponseMapping
                                                                                     method:RKRequestMethodAny
                                                                                pathPattern:pathPattern
                                                                                    keyPath:nil
                                                                                statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    return descriptor;
}

@end
