//
//  Person.h
//  Properties3PrivateProperties
//
//  Created by Jonathan Paul on 11/5/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
// Omitting the name property here so that it is private through being defined in an extension of Person
- (void)printGreeting;
@end

NS_ASSUME_NONNULL_END
