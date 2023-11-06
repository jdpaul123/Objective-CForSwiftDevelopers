//
//  Person.m
//  Properties
//
//  Created by Jonathan Paul on 11/4/23.
//

#import "Person.h"

@implementation Person

// You can change the synthesized ivar from _name to be anything you want like, for example, userName
//@synthesize name = userName;
//@synthesize name; // This is a terrible idea because it confuses the getter and the ivar to both be called name.
//@synthesize name = _name; // This is pointless because the produced ivar will already be called _name. This is used when someone creates a custon getter and setter

- (void)printGreeting {
//    NSLog(@"Hello %@", name); // This is if you create an ivar called name in the .h file
    NSLog(@"Hello %@", _name); // This is accessing the synthesised ivar. No good reason to do this
    NSLog(@"Hello %@", [self name]); // This is using the name getter method
//    NSLog(@"Hello %@", userName); // If you uncomment the @synthesize name = userName; line above then this will work and _name will not
    NSLog(@"Hello %@", self.name); // This is using the syntactic sugar way of calling the name getter method
}

@end
