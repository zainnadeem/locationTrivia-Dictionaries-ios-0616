//
//  FISAppDelegate.h
//  locationTrivia-Dictionaries
//
//  Created by Joe Burgess on 5/13/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/**
 
 *  Declare your method names here.
 
 */

- (NSString *)shortenedNameOfLocation:(NSDictionary *)location
                             toLength:(NSInteger)length;

- (NSDictionary *)dictionaryForLocationWithName:(NSString *)name
                                       latitude:(NSNumber *)latitude
                                      longitude:(NSNumber *)longitude;

- (NSArray *)namesOfLocations:(NSArray *)locations;

- (BOOL)dictionaryHasValidLocation:(NSDictionary *)location;

- (NSDictionary *)retrieveLocationByName:(NSString *)name
                             inLocations:(NSArray *)locations;

@end
