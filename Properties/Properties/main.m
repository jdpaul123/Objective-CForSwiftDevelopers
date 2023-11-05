//
//  main.m
//  Properties
//
//  Created by Jonathan Paul on 11/4/23.
//

#import <Foundation/Foundation.h>
#import "Person.h"

// NOTE: Objective-C didn't have properties until 20 years after its creation
/*
 Originally a property was a method that gets adn sets the value of an ivar. As of Xcode 4.4 you don't need to deal with ivars; properties
 deal with everything for you. These properties that do not deal with ivars are known as Pure Properties.
 */
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *person = [Person new];
        // To perform indirect member access you use ->
//        person->name = @"Taylor"; // This is the ivar way
//        [person setName:@"Taylor"]; // This is how to set a pure property
        person.name = @"Taylor"; // This is the syntactic sugar way to set a pure property.
        // Every pure property is using a getter or setter method that us autimatically created under the hood
        [person printGreeting];
    }
    return 0;
}
