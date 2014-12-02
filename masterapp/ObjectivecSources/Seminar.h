//
//  Seminars.h
//  OBI
//
//  Created by Mykola Denysyuk on 3/26/13.
//  Copyright (c) 2013 Tayphoon. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <CoreData/CoreData.h>
//#import <RestKit/RestKit.h>
//#import "SeminarLocation.h"

//@class WelcomeLetter;
@class RKObjectMapping;

@interface Seminar : NSObject

@property NSNumber* seminarID;
@property NSString* seminarName;
@property NSString* seminarDescription;
@property NSString* seminarDescriptionHTML;
@property NSString* videoPath;
@property NSString* imagePath;

@property NSNumber* isIntroVideoPlayed;

@property NSOrderedSet* wheelItems;

@property NSOrderedSet* competes;

@property NSDate* startDate;
@property NSDate* endDate;

@property NSNumber* isPrimary;

//@property (strong) NSSet * excludeAsMessageRecipientUsers;

@property (strong) NSString * backgroundImagePath;
@property (strong) NSString * iphoneBackgroundImagePath;
@property (strong) NSString * topLeftBackgroundImagePath;

//@property (nonatomic, retain) WelcomeLetter *letter;

@property (nonatomic, retain) NSNumber * isAgendaVisible;
@property (nonatomic, retain) NSString * agendaUrl;

//@property SeminarLocation * location;
+ (RKObjectMapping*)objectMapping;
- (NSString* )safeImagePath;

- (NSString* )safeBacgroundImagePath;

- (NSString* )safeTopLeftImagePath;

@end
