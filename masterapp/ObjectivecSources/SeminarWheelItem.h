//
//  SeminarWheelItem.h
//  OBI
//
//  Created by Mykola Denysyuk on 7/22/13.
//  Copyright (c) 2013 Tayphoon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Seminar, RKObjectMapping;

@interface SeminarWheelItem : NSObject

@property (nonatomic, retain) NSString * itemCode;
@property (nonatomic, retain) NSString * itemName;
@property (nonatomic, retain) NSNumber * itemOrdinal;
@property (nonatomic, retain) Seminar *seminar;

+ (RKObjectMapping *)objectMapping;

@end
