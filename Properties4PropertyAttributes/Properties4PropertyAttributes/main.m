//
//  main.m
//  Properties4PropertyAttributes
//
//  Created by Jonathan Paul on 11/5/23.
//

#import <Foundation/Foundation.h>
#import "Person.h"

/*
 NOTE: This CLI program is based on a copy of Properties3PrivateProperties
 There are 11 property attributes
 Some are implicitly added to the code without adding them, but most developers add them manually whether implicitly added or not.
 However, Paul Hudson, says that you should only specify the attributes that are not default.

 “strong: This is the default for objects, and means “hold onto the memory.” This is the default for properties in Swift.
 weak: This creates a weak reference for objects, just like weak properties in Swift. This is useful for breaking strong reference cycles.
 copy: This takes a copy of whatever object is assigned to the property.
 assign: This is the default for primitive types, and just assigns the value to the ivar.
 nonatomic: An atomic property is one that will include extra code to ensure reading a value at the same time as it’s being written on another thread won’t produce garbage data. A non-atomic property is the opposite: that extra code isn’t added, so you need to make sure you don’t read and write the property simultaneously.
 retain: An old form of strong. If you see this, it’s a sure signal you’re working with old code.
 readonly: Do not generate a setter for this property.
 readwrite: Generate a getter and setter for this property. This is the default for properties of all types.
 atomic: See nonatomic above. Creating an atomic property has a small performance impact, but it keeps your code safe. This is the default for[…]”

 - You cannot use some of these at the same time becasue that wouldnt make sense:
    - strong, weak, copy, or assign
    - readonly or readwrite
    - atomic or nonatomic
 */
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *person = [Person new];
        //person.name = @"Taylor"; // Name is not found because it is not in the .h file and is defined in the extension
        [person printGreeting];
    }
    return 0;
}
