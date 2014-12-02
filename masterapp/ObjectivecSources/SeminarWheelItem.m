//
//  SeminarWheelItem.m
//  OBI
//
//  Created by Mykola Denysyuk on 7/22/13.
//  Copyright (c) 2013 Tayphoon. All rights reserved.
//

#import "SeminarWheelItem.h"
#import "Seminar.h"
#import <RestKit/RestKit.h>

@implementation SeminarWheelItem

//@dynamic itemCode;
//@dynamic itemName;
//@dynamic itemOrdinal;
//@dynamic seminar;

+ (RKObjectMapping*)objectMapping
{
    RKObjectMapping* objectMapping = [RKObjectMapping mappingForClass:self.class];
    [objectMapping addAttributeMappingsFromDictionary:
     @{
     @"Code"    : @"itemCode",
     @"Name"    : @"itemName",
     @"Ordinal" : @"itemOrdinal"
     }
     ];
    
    return objectMapping;
}

@end
