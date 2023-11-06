//
//  main.m
//  Properties3PrivateProperties
//
//  Created by Jonathan Paul on 11/5/23.
//

#import <Foundation/Foundation.h>
#import "Person.h"

/*
 MARK: Private properties
 You cannot make a truely private property because you cannot make a truely private method so the getter is always accessible.
 You can omit a method from the .h file so they cannot be called directly, but they are still callable through the performSelector function.
 This does not make it that private though, because you still need to declare the ivar which is not private.
 Moving a property to a class etension allows us to make it more of a private variable.
 */

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *person = [Person new];
        //person.name = @"Taylor"; // Name is not found because it is not in the .h file and is defined in the extension
        [person printGreeting];
    }
    return 0;
}
