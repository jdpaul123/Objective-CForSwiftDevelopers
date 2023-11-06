//
//  main.m
//  Nullability
//
//  Created by Jonathan Paul on 11/5/23.
//

#import <Foundation/Foundation.h>
#import "Person.h"

// Add nullability to the .h file and not the .m file. It will cause problems if you do it in both files.
// You can make the file assume that everything is non-null and opt out of the parts that might be null using: NS_ASSUME_NONNULL_BEGIN and NS_ASSUME_NONNULL_END
// You place the macros at the start and end of the file to creaet a block to tell the comiler that everything has a value (ie. is not optional)
// The macros replace using the nonnull keyword
// FIXME: It looks like the book's age is showing as NS_ASSUME_NONNULL... is automatically added to all .h files in up-to-date versions of Xcode
// In fact, if you get rid of the macros and use the nonnull keyword you have to then add _nonnull to the type specification of the arguments for the methods in the class too.

// MARK: Syntactic Analyzer
/*
 USE THIS TO FIND NIL VALUES WHEN THE COMPILER, ON ITS OWN, CANNOT
 Turn on the Analyzer for every build
 Go to your build settings and search for “analysis”. Enable “Analyze During Build”,
 and if you’re really intent on catching everything then set “Mode of Analysis for Build” to Deep.”
 */

// MARK: null_resettable
/*
 This is rarely used. It is used in tintColor for controls in iOS. If set to null the getter will always return iOS's standard sky blue shade.
 “To make our name property be null_resettable, modify its definition in Person.h to this:
 @property (null_resettable) NSString *name;
 Now add this to Person.m:
 @synthesize name = _name;

 - (NSString *)name {
     if (_name == nil) {
         return @"Anonymous";
     } else {
         return _name;
     }
 }

 - (void)setName:(NSString *)name {
     _name = name;
 }
 Using this approach, you can now set name to be nil, but if you read it back you’ll always get a value because it’s being supplemented by the default.”
 */

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *person = [[Person alloc] initWithName:@"JD"];
        NSString *greeting = [person fetchGreetingForTime:@"morning"];
        NSLog(@"%@", greeting);
    }
    return 0;
}
