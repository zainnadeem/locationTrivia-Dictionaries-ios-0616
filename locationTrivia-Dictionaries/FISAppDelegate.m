//
//  FISAppDelegate.m
//  locationTrivia-Dictionaries
//
//  Created by Joe Burgess on 5/13/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

/** 
 
 *  Write your method implementations here.
 
 */

-(NSString *)shortenedNameOfLocation:(NSDictionary *)location
                            toLength:(NSInteger)length {
    
    NSString *name = location[@"name"];
    if (length < 0) {
        return name;
    }
    
    return [name substringToIndex:length];

}

- (NSDictionary *)dictionaryForLocationWithName:(NSString *)name
                                       latitude:(NSNumber *)latitude
                                      longitude:(NSNumber *)longitude {
    
    NSDictionary *location =  @{ @"name"     : name      ,
                                 @"latitude" : latitude  ,
                                 @"longitude": longitude };
    
    return location;
}

-(NSArray *)namesOfLocations:(NSArray *)locations {
    
    NSMutableArray *names = [[NSMutableArray alloc] init];
    for (NSDictionary *location in locations) {
        NSString *name = location[@"name"];
        [names addObject:name];
    }

    return [NSArray arrayWithArray:names];
}

- (BOOL)dictionaryHasValidLocation:(NSDictionary *)location {
    
    if (location.allKeys.count != 3) {
        return NO;
    }
    
    if (!location[@"name"]) {
        return NO;
    } else {
        // there are no tests for this code, it just feels like good practice
        if (![location[@"name"] isKindOfClass:[NSString class]]) {
            return NO;
        }
        NSString *name = location[@"name"];
        if (name.length == 0 ) {
            return NO;
        }
        // end
    }
    
    if (!location[@"latitude"]) {
        return NO;
    } else {
        // there are no tests for this code, it just feels like good practice
        if (![location[@"latitude"] isKindOfClass:[NSNumber class]]) {
            return NO;
        }
        CGFloat latitude = [location[@"latitude"] floatValue];
        if (latitude > 90.0 || latitude < -90.0) {
            return NO;
        }
        // end
    }
    
    if (!location[@"longitude"]) {
        return NO;
    } else {
        // there are no tests for this code, it just feels like good practice
        if (![location[@"longitude"] isKindOfClass:[NSNumber class]]) {
            return NO;
        }
        CGFloat longitude = [location[@"longitude"] floatValue];
        if (longitude > 180.0 || longitude <= -180.0) {
            return NO;
        }
        // end
    }
    
    return YES;
}

- (NSDictionary *)retrieveLocationByName:(NSString *)name
                             inLocations:(NSArray *)locations {
    
    for (NSDictionary *location in locations) {
        NSString *locationName = location[@"name"];
        if ([locationName isEqualToString:name]) {
            return location;
        }
    }
    return nil;
}

@end
