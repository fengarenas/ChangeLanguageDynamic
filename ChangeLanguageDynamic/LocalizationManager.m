//
//  LocalizationManager.m
//  StaffDirectory
//
//  Created by Four Directions on 25/7/14.
//  Copyright (c) 2014 Four Directions. All rights reserved.
//

#import "LocalizationManager.h"

@implementation LocalizationManager {
    NSBundle *bundle;
}

+ (LocalizationManager *)sharedManager {
    static dispatch_once_t pred;
    static LocalizationManager *shared = nil;
    dispatch_once(&pred, ^{
        shared = [LocalizationManager new];
    });
    return shared;
}

- (void)setLanguage:(NSString *)language {
    NSBundle *setBundle = [self bundleForLanguage:language];
    if (![bundle.bundlePath isEqualToString:setBundle.bundlePath]) {
        bundle = setBundle;
        [[NSNotificationCenter defaultCenter]postNotificationName:languageChangedNoti object:nil];
    }
}

- (NSString *)localizedStringForKey:(NSString *)key {
    return [bundle localizedStringForKey:key value:nil table:nil];
}

- (NSString *)localizedStringForKey:(NSString *)key language:(NSString *)language {
    NSBundle *theBundle = [self bundleForLanguage:language];
    if (!theBundle) {
        return key;
    }
    return [theBundle localizedStringForKey:key value:nil table:nil];
}

- (NSBundle *)bundleForLanguage:(NSString *)language {
    NSString *path = [[NSBundle mainBundle]pathForResource:language ofType:@"lproj" ];
    if (!path) {
        path = [[NSBundle mainBundle] pathForResource:@"Base" ofType:@"lproj" ];
    }
    return [NSBundle bundleWithPath:path];
}

@end
