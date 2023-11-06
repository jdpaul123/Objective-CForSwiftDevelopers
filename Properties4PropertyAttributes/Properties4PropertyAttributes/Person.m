//
//  Person.m
//  Properties4PropertyAttributes
//
//  Created by Jonathan Paul on 11/5/23.
//

#import "Person.h"

@interface Person () // Writing the empty parentheses specifies that this is a class extension
//@property (strong, atomic, readwrite) NSString *name; // added the strong, atomic, and readwrite attributes. Those attributes are the default if you do not specify other ones explicitly.
@property (copy) NSString *name; // Since someone could send an NSMutableString in place of an NSString, using the "copy" attribute makes it so that it will always be copied on access.
@end

@implementation Person

- (void)printGreeting {
    NSLog(@"Hello, %@!", self.name);
}

@end
