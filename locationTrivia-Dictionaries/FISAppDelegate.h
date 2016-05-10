//  FISAppDelegate.h

#import <UIKit/UIKit.h>

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

-(NSString *) stringByTruncatingNameOfLocation: (NSDictionary *)location toLength:(NSUInteger) length;

-(NSDictionary *) dictionaryForLocationWithName: (NSString *)name latitude: (CGFloat) latitude longitude:(CGFloat)longitude;

-(NSArray *)namesOfLocations: (NSArray *)location;

-(BOOL)dictionaryIsValidLocation:(NSDictionary*)locationDictionary;

-(NSDictionary*) locationNamed:(NSString*)name inLocations:(NSArray*)locations;

@end
