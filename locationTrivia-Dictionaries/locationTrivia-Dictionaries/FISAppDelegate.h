//
//  FISAppDelegate.h
//  locationTrivia-Dictionaries
//
//  Created by Joe Burgess on 5/14/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (NSString *)shortenLocationNameWithLocation:(NSDictionary *)location ToCount:(NSInteger)count;
- (NSDictionary *)createLocationWithName:(NSString *)name Latitude:(NSNumber *)latitude Longitude:(NSNumber *)longitude;
@end
