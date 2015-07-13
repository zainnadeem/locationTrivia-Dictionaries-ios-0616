//
//  FISAppDelegateSpec.m
//  locationTrivia-Dictionaries
//
//  Created by Joe Burgess on 5/14/14.
//  Copyright 2014 Joe Burgess. All rights reserved.
//

#import "Specta.h"
#define EXP_SHORTHAND
#import <Expecta.h>
#import "FISAppDelegate.h"


SpecBegin(FISAppDelegate)

describe(@"FISAppDelegate", ^{
    __block FISAppDelegate *appDelegate;
    
    __block NSString *empireStateName;
    __block NSNumber *empireStateLat;
    __block NSNumber *empireStateLng;
    
    __block NSDictionary *location0;
    __block NSDictionary *location1;
    __block NSDictionary *location2;
    
    __block NSArray *locations;
    
    beforeEach(^{

        appDelegate = [[FISAppDelegate alloc] init];
        
        empireStateName = @"Empire State Building";
        empireStateLat  = @23.432;
        empireStateLng  = @-34.34;
        
        location0 = @{ @"name"      : empireStateName,
                       @"latitude"  : empireStateLat ,
                       @"longitude" : empireStateLng
                      };
        
        location1 = @{ @"name"      : @"The Flatiron School",
                       @"latitude"  : @34.432 ,
                       @"longitude" : @-23.67
                      };
        
        location2 = @{ @"name"      : @"Statue Of Liberty",
                       @"latitude"  : @78.34 ,
                       @"longitude" : @92.42
                      };
        
        locations = @[ location0, location1, location2 ];
    });

    describe(@"shortenedNameOfLocation:toLength:", ^{
        it(@"returns an NSString object", ^{
            expect([appDelegate shortenedNameOfLocation:location1 toLength:5]).to.beKindOf([NSString class]);
        });
        
        it(@"returns a shortened location name to 3 characters long when submitted a length argument of 3", ^{
            NSString *shortenedName =[appDelegate shortenedNameOfLocation:location0 toLength:3];
            expect(shortenedName.length).to.equal(3);
        });

        it(@"returns a shortened location name to 5 characters long when submitted a length argument of 5", ^{
            NSString *shortenedName =[appDelegate shortenedNameOfLocation:location0 toLength:5];
            expect(shortenedName.length).to.equal(5);
        });

        it(@"returns the original location name when submitted a negative length argument", ^{
            NSString *shortenedName =[appDelegate shortenedNameOfLocation:location0 toLength:-5];
            expect(shortenedName).to.equal(location0[@"name"]);
        });
    });

    describe(@"dictionaryForLocationWithName:latitude:longitude:", ^{
        it(@"returns an NSDictionary object", ^{
            expect([appDelegate dictionaryForLocationWithName:empireStateName latitude:empireStateLat longitude:empireStateLng]).to.beKindOf([NSDictionary class]);
        });

        it(@"returns a dictionary with the submitted values for the correct keys", ^{
            NSDictionary *newLocation = [appDelegate dictionaryForLocationWithName:empireStateName latitude:empireStateLat longitude:empireStateLng];
            expect(newLocation).to.equal(location0);
        });
    });

    describe(@"namesOfLocations:", ^{
        it(@"returns an NSArray object", ^{
            expect([appDelegate namesOfLocations:locations]).to.beKindOf([NSArray class]);
        });
        
        it(@"returns an array containing the expected three objects", ^{
            NSArray *locationNames = [appDelegate namesOfLocations:locations];
            
            expect(locationNames.count).to.equal(3);
        });

        it(@"returns an array containing all of the expected location names", ^{
            NSArray *locationNames = [appDelegate namesOfLocations:locations];
            
            expect(locationNames).to.contain(location0[@"name"]);
            expect(locationNames).to.contain(location1[@"name"]);
            expect(locationNames).to.contain(location2[@"name"]);
        });
    });

    describe(@"dictionaryHasValidLocation:", ^{
        it(@"returns YES for a correct location", ^{
            expect([appDelegate dictionaryHasValidLocation:location0]).to.beTruthy();
        });

        it(@"Should return NO for a location with incorrect keys", ^{
            NSDictionary *locationWithBadKeys = @{ @"n4m3"     : @"Atlantis" ,
                                                   @"l0c4710n" : @1          ,
                                                   @"l471700d" : @1          };
            expect([appDelegate dictionaryHasValidLocation:locationWithBadKeys]).to.beFalsy();
        });

        it(@"Should return NO for a location with not enough keys", ^{
            NSDictionary *locationWithNotEnoughKeys = @{ @"name"    : @"Atlantis" ,
                                                         @"latitude": @1          };
            
            expect([appDelegate dictionaryHasValidLocation:locationWithNotEnoughKeys]).to.beFalsy();
        });

        it(@"Should return NO for a location with extra keys", ^{
            NSDictionary *locationWithTooManyKeys = @{ @"name"       : @"Atlantis"    ,
                                                       @"latitude"   : @1             ,
                                                       @"longitude"  : @1             ,
                                                       @"trivia"     : @[ @"legend" ] };
            expect([appDelegate dictionaryHasValidLocation:locationWithTooManyKeys]).to.beFalsy();
        });
    });

    describe(@"retrieveLocationByName:inLocations:", ^{
        it(@"returns an NSDictionary object", ^{
            expect([appDelegate retrieveLocationByName:@"The Flatiron School" inLocations:locations]).to.beKindOf([NSDictionary class]);
        });

        it(@"returns the correct NSDictionary Location", ^{
            expect([appDelegate retrieveLocationByName:empireStateName inLocations:locations]).to.equal(location0);
        });

        it(@"returns 'nil' if no location is found with that name", ^{
            expect([appDelegate retrieveLocationByName:@"Atlantis" inLocations:locations]).to.beNil();
        });
    });
   
});

SpecEnd
