//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}



-(NSString *) stringByTruncatingNameOfLocation: (NSDictionary *)location toLength:(NSUInteger) length{
    NSString *dictionaryToString = location[@"name"];
    NSString *stringByTruncatingNameOfLocation;
    if ([dictionaryToString length] >= length){
        stringByTruncatingNameOfLocation = [dictionaryToString substringToIndex:length];
    }else{
        stringByTruncatingNameOfLocation = location[@"name"];
    }
    
    return stringByTruncatingNameOfLocation;
}



-(NSDictionary *) dictionaryForLocationWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude{
    
    
    
    NSNumber *longitudeFloatNumber = @(longitude);
    NSNumber *latitudeFloatNumber = @(latitude);
    
    
    NSDictionary *dictionaryForLocationWithNames =  @{ @"name": name,
                                                       @"latitude": latitudeFloatNumber,
                                                       @"longitude": longitudeFloatNumber};
    
    
    NSLog( @"\n\n%@\n\n" , dictionaryForLocationWithNames);
    return dictionaryForLocationWithNames;
}


-(NSArray *)namesOfLocations: (NSArray *)location{
    NSArray* namesOfLocations;
    NSMutableArray *mNamesOfLocation = [[NSMutableArray alloc]init];
    for(NSUInteger i =0 ;i <[location count];i++){
        [mNamesOfLocation addObject:location[i][@"name"]];
    }
    namesOfLocations = mNamesOfLocation;
    
    return namesOfLocations ;
    
}


-(BOOL)dictionaryIsValidLocation:(NSDictionary*)locationDictionary{
    BOOL *dictionaryIsValidLocation;
    if (([[locationDictionary allKeys] containsObject:@"name"]) && ([[locationDictionary allKeys] containsObject:@"latitude"])  && ([[locationDictionary allKeys] containsObject:@"longitude"]) && ([locationDictionary count] == 3)){
        return true;
    }else{
        return false;
    }
    
    return dictionaryIsValidLocation;
}


-(NSDictionary*) locationNamed:(NSString*)name inLocations:(NSArray*)location{
    NSDictionary *locationNamed;
    for(NSUInteger i =0 ;i <[location count];i++){
        if ([location[i] containsObject:name]){
            locationNamed =location[i];
            return locationNamed;
        }else{ nil;
        }}
    return locationNamed;
}
@end

