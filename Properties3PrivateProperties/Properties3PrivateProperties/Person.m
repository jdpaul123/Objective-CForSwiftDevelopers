//
//  Person.m
//  Properties3PrivateProperties
//
//  Created by Jonathan Paul on 11/5/23.
//

#import "Person.h"

// MARK: Private variable
// To make a private variable we define the property in an extension of the class the property is in
@interface Person () // Writing the empty parentheses specifies that this is a class extension
@property NSString *name;
@end

@implementation Person

- (void)printGreeting {
    NSLog(@"Hello, %@!", self.name);
}

@end
