//
//  Person.h
//  Properties
//
//  Created by Jonathan Paul on 11/4/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/*
 To create an ivar we must put an open curly brace right after the "@interface Person : NSObject" and specify that the ivar is publicly available with "@public"
 */
//@interface Person : NSObject {                                                // This is the ivar way
//    @public                                                                   // This is the ivar way
//    NSString * name; // This is an instance variable or ivar, for short       // This is the ivar way
//}

@interface Person : NSObject
@property NSString *name; // Using @property i called synthesizing an ivar. It craetes a getter called name, a setter called setName, and an ivar called _name
- (void)printGreeting;
@end

NS_ASSUME_NONNULL_END
