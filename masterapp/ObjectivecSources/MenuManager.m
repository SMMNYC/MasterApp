//
//  MenuManager.m
//  masterapp
//
//  Created by Mykola Denysyuk on 12/2/14.
//  Copyright (c) 2014 scimedmedia. All rights reserved.
//

#import "MenuManager.h"
#import "Seminar.h"
#import "SeminarWheelItem.h"

static NSString * HOME_IPHONE =             @"HOME_IPHONE";             //      Home
static NSString * PROFILE_IPHONE  =         @"PROFILE_IPHONE";          //      Profile
static NSString * SCHEDULE_IPHONE =         @"SCHEDULE_IPHONE";         //      Schedule
static NSString * PEOPLE_IPHONE  =          @"PEOPLE_IPHONE";           //      People
static NSString * MAPS_IPHONE    =          @"MAPS_IPHONE";             //      Maps
static NSString * GUIDES_IPHONE  =          @"GUIDES_IPHONE";           //      Guides
static NSString * EVENT_FEED_IPHONE =       @"EVENT_FEED_IPHONE";       //      Event feed
static NSString * SPONSORS_EXHIBITS_IPHONE= @"SPONSORS_EXHIBITS_IPHONE";//      Sponsors & Exhibits
static NSString * BOOK_ROOM_IPHONE  =       @"BOOK_ROOM_IPHONE";        //      Book a Room
static NSString * EVENTS_IPHONE  =          @"EVENTS_IPHONE";           //      Events
static NSString * PREFERENCES_IPHONE  =     @"PREFERENCES_IPHONE";      //      Preferences

NSString * const kMenuManagerUpdated = @"kMenuManagerUpdated";

static MenuManager * _sharedManager = nil;

@implementation MenuManager
{
    NSDictionary * menuData;
    NSArray * _items;
}

#pragma mark - Lifecycle:

- (id)init
{
    self = [super init];
    if (self) {
        menuData = @{HOME_IPHONE: @"Home",
                     PROFILE_IPHONE:   @"Profile",
                     SCHEDULE_IPHONE: @"Schedule",
                     BOOK_ROOM_IPHONE: @"Book A Room",
                     PEOPLE_IPHONE: @"People",
                     MAPS_IPHONE: @"Maps",
                     GUIDES_IPHONE: @"Guides",
                     @"": @"Learning",
                     PREFERENCES_IPHONE: @"Programs",
                     @"": @"Catalog",
                     @"": @"Forum",
                     SPONSORS_EXHIBITS_IPHONE: @"Community",
                     EVENT_FEED_IPHONE: @"Feed",
                     EVENTS_IPHONE: @"Events"};
    }
    return self;
}

+ (instancetype)sharedManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_sharedManager == nil) {
            _sharedManager = [MenuManager new];
        }
    });
    return _sharedManager;
}

- (void)configureWithSeminar:(Seminar *)seminar
{
    NSMutableArray * tmpList = [NSMutableArray arrayWithCapacity:seminar.wheelItems.count];
    
    NSArray * orderedWheel = [seminar.wheelItems sortedArrayWithOptions:NSSortConcurrent usingComparator:^NSComparisonResult(id obj1, id obj2) {
        return [((SeminarWheelItem *)obj1).itemOrdinal compare:((SeminarWheelItem *)obj1).itemOrdinal];
    }];
    
    for (SeminarWheelItem * wi in orderedWheel) {
        
        NSString * meta = [menuData valueForKey:wi.itemCode.uppercaseString];
        if (meta)
            [tmpList addObject:meta];
    }
    _items = [NSArray arrayWithArray:tmpList];
    
    [self notifyMenuController];
}

- (void)notifyMenuController
{
    [[NSNotificationCenter defaultCenter] postNotificationName:kMenuManagerUpdated object:nil];
}

#pragma mark - Accessors:

- (NSInteger)count
{
    return _items.count;
}

- (NSString *)titleForItem:(NSInteger)itemIndex
{
    return itemIndex<_items.count ? _items[itemIndex] : nil;
}

- (NSString *)iconNameForItem:(NSInteger)itemIndex
{
    NSString * title = [self titleForItem:itemIndex];
    if (title) {
        title = [title stringByReplacingOccurrencesOfString:@" " withString:@""].lowercaseString;
        return [NSString stringWithFormat:@"%@_icon", title];
    }
    return nil;
}

@end
