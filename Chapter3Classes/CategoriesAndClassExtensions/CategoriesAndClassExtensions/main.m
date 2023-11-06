//
//  main.m
//  CategoriesAndClassExtensions
//
//  Created by Jonathan Paul on 11/5/23.
//

#import <Foundation/Foundation.h>

/*
 Categories are equivalent to Swift Extensions
 You must prefix any methods in Categories with something to make it unique like your initials (ex. jp_method).
 If Apple adds a built-in method with the same name "Bad things" will happen.
 Extensions are created as Categories, but with no name (ex. (trimming)). That are more powerful because they can do both:
 - They can add properties and ivars to a class
 - They can add methods
 You cannot extens Apple's classes. You can create categories from them
 Extensiins are often used to add properties that are not exposed in the .h file (ie. they act like private properties)

 You can also create a readonly property in the header and then redefine it in an extension as readwrite. That makes it so that inside the class you can
 edit the value, while any other file that interfaces with the class can only read it.
 */
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
    }
    return 0;
}
