//
//  Person.m
//  PropertiesContinued
//
//  Created by Jonathan Paul on 11/5/23.
//

#import "Person.h"

@implementation Person

// Below I am creating a custom getter and setter and setting the ivar name manually
// You must synthesize the ivar if you override the getter or setter
// You must access _name in the setter. If you used self.name it would reusively called itself until a program crash occurred.
// Accessing the ivar directly should only be done in getters and seters or when working with object creation
// (OTHERWISE ALWAYS USE self. TO ACCESS IVARS THROUGH THEIR PROPERTIES)
@synthesize name = _name;

- (void)printGreeting {
    NSLog(@"Hello, %@!", self.name);
}

- (NSString*)name {
    NSLog(@"Reading name!");
    return _name;
}

- (void)setName:(NSString *)newName {
    NSLog(@"Writing name!");
    _name = newName;
}

@end
