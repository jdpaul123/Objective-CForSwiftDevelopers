//
//  Person.h
//  PropertiesContinued
//
//  Created by Jonathan Paul on 11/5/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property NSString *name; // the name property gets paired to the @synthesize name property in the .m file
- (void)printGreeting;
@end

NS_ASSUME_NONNULL_END
