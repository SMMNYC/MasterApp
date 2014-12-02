//
//  MenuManager.h
//  masterapp
//
//  Created by Mykola Denysyuk on 12/2/14.
//  Copyright (c) 2014 scimedmedia. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const kMenuManagerUpdated;

@class Seminar;
@interface MenuManager : NSObject

+ (instancetype)sharedManager;

- (void)configureWithSeminar:(Seminar *)seminar;
- (void)configureWithResponse:(id )response;

- (NSInteger)count;
- (NSString *)titleForItem:(NSInteger)itemIndex;
- (NSString *)iconNameForItem:(NSInteger)itemIndex;

@end
