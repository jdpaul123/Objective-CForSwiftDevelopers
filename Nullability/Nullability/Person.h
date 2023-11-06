//
//  Person.h
//  Nullability
//
//  Created by Jonathan Paul on 11/5/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property NSString *name;
- (instancetype)initWithName:(NSString*)name;
- (NSString*)fetchGreetingForTime:(NSString*)time;

@end

NS_ASSUME_NONNULL_END

// You used to have to use nonnull keyword, but now the NS_ASSUME_NONNULL... macros are added automatically
// To add nullability you used to have to do this:
/*
 @interface Person : NSObject

 @property (nonnull) NSString *name;
 - (nonnull instancetype)initWithName:(NSString*_Nonnull)name;
 - (nonnull NSString*)fetchGreetingForTime:(NSString*_Nonnull)time;

 @end
 */
