//
//  Person.h
//  IntroductionToClasses
//
//  Created by Jonathan Paul on 11/4/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

// If we don't put the function declaratoin in the .h file, then the method is effectively private
- (void)printGreeting;
- (void)printGreeting:(NSString*)greeting;
// The convention is to include the first parameter name in the function title
- (void)printGreetingTo:(NSString*)name atTimeOfDay: (NSString*)time;
- (NSDictionary*)fetchGreetingTo:(NSString*)name atTimeOfDay:(NSString*)time;
@end

NS_ASSUME_NONNULL_END
