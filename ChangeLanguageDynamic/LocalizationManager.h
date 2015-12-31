//
//  LocalizationManager.h
//  StaffDirectory
//
//  Created by Four Directions on 25/7/14.
//  Copyright (c) 2014 Four Directions. All rights reserved.
//

#import <Foundation/Foundation.h>

#define setLanguage(language) \
[[LocalizationManager sharedManager] setLanguage:(language)]

#define getString(key) \
[[LocalizationManager sharedManager] localizedStringForKey:(key)]

#define getStringWithLanguage(key,lang) \
[[LocalizationManager sharedManager] localizedStringForKey:(key) language:(lang)]

static NSString *const languageChangedNoti = @"languageChangedNoti";

@interface LocalizationManager : NSObject

+ (instancetype)sharedManager;
- (void)setLanguage:(NSString *)language;
- (NSString *)localizedStringForKey:(NSString *)key;
- (NSString *)localizedStringForKey:(NSString *)key language:(NSString *)language;

@end
