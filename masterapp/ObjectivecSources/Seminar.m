//
//  Seminars.m
//  OBI
//
//  Created by Mykola Denysyuk on 3/26/13.
//  Copyright (c) 2013 Tayphoon. All rights reserved.
//

#import "Seminar.h"
#import "SeminarWheelItem.h"
#import <RestKit/RestKit.h>
//#import "SeminarCompetes.h"
//#import "WelcomeLetter.h"
//#import "SeminarLocation.h"
//#import "SeminarUserProfile.h"
//

@implementation Seminar
//
//@dynamic seminarID;
//@dynamic seminarName;
//@dynamic seminarDescription;
//@dynamic seminarDescriptionHTML;
//@dynamic videoPath;
//@dynamic imagePath;
//@dynamic isIntroVideoPlayed;
//@dynamic wheelItems;
//@dynamic competes;
//@dynamic startDate;
//@dynamic endDate;
//@dynamic isPrimary;
//@dynamic backgroundImagePath;
//@dynamic topLeftBackgroundImagePath;
//@dynamic letter;
//@dynamic isAgendaVisible;
//@dynamic agendaUrl;
//@dynamic location;
//@dynamic iphoneBackgroundImagePath;

+ (RKObjectMapping*)objectMapping;
{
    RKObjectMapping * seminar = [RKObjectMapping mappingForClass:self.class];
    
//    [seminar setIdentificationAttributes:@[@"seminarID"]];
    
    [seminar addAttributeMappingsFromDictionary:
     @{
     @"SeminarID"    : @"seminarID",
     @"Name"         : @"seminarName",
     @"Description"  : @"seminarDescription",
     @"DescriptionHTML": @"seminarDescriptionHTML",
     @"IntroVideoPath" : @"videoPath",
     @"ImagePath"      : @"imagePath",
     @"StartDateTime"  : @"startDate",
     @"EndDateTime"    : @"endDate",
     @"IsPrimary"      : @"isPrimary",
     @"IpadBackgroundImagePath"     : @"backgroundImagePath",
     @"TopRightImagePath"           : @"topLeftBackgroundImagePath",
     @"UserAgendaVisible"           : @"isAgendaVisible",
     @"AgendaUrl"                   : @"agendaUrl",
     @"IphoneBackgroundImagePath"   : @"iphoneBackgroundImagePath"
     }
     ];
    
    RKRelationshipMapping* wheelItemsRelation = [RKRelationshipMapping relationshipMappingFromKeyPath:@"SeminarWheels.SeminarWheel"
                                                                                            toKeyPath:@"wheelItems"
                                                                                          withMapping:[SeminarWheelItem objectMapping]];
    [seminar addPropertyMapping:wheelItemsRelation];
    
//    RKRelationshipMapping* competesRelation = [RKRelationshipMapping relationshipMappingFromKeyPath:@"SeminarCompetes.SeminarCompete"
//                                                                                          toKeyPath:@"competes"
//                                                                                        withMapping:[SeminarCompetes objectMappingForManagedObjectStore:store]];
//    [seminar addPropertyMapping:competesRelation];
    
//    RKRelationshipMapping* letter = [RKRelationshipMapping relationshipMappingFromKeyPath:@"WelcomeLetter"
//                                                                                toKeyPath:@"letter"
//                                                                              withMapping:[WelcomeLetter objectMappingForManagedObjectStore:store]];
//    [seminar addPropertyMapping:letter];
//    
//    
//    RKRelationshipMapping* location = [RKRelationshipMapping relationshipMappingFromKeyPath:@"Location"
//                                                                                toKeyPath:@"location"
//                                                                              withMapping:[SeminarLocation objectMappingForManagedObjectStore:store]];
//    [seminar addPropertyMapping:location];
//    
//
//
//    RKRelationshipMapping * excludedUsers =  [RKRelationshipMapping relationshipMappingFromKeyPath:@"ExcludeAsMessageRecipientUsers" toKeyPath:@"excludeAsMessageRecipientUsers" withMapping:[SeminarUserProfile objectMappingForManagedObjectStore:store]];
//
//    [seminar addPropertyMapping:excludedUsers];
    
    
    return seminar;
}

// Safe nsstring

- (NSString* )safeImagePath
{
    return self.imagePath ? [self.imagePath stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] : @"";
}

- (NSString* )safeBacgroundImagePath
{
    return self.backgroundImagePath ? [self.backgroundImagePath stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] : @"";
}

- (NSString* )safeTopLeftImagePath
{
    return self.topLeftBackgroundImagePath ? self.topLeftBackgroundImagePath : @"";
}

@end
