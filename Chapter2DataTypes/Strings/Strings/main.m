//
//  main.m
//  Strings
//
//  Created by Jonathan Paul on 11/3/23.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Create an NSString
        NSString *foo = @"Hello, World!";
        NSLog(@"%@", foo);

        // Using format specifiers
        NSInteger number = 42;
        NSString *output = [NSString stringWithFormat:@"You picked %ld", (long)number];
        NSLog(@"%@", output);

        // Or you can use alloc/init to do the same thing
        NSString *output2 = [[NSString alloc] initWithFormat:@"You picked %ld", (long)number];
        NSLog(@"%@", output2);
        // The above two ways of initializing a string were different before automatic reference counting (ARC) was introduced in 2011, but now they are effectively the same

        // The method to initialize a string from contents of a file are
        /*
         NSString *output = [[NSString alloc] initWithContentsOfFile:@"hello.txt" usedEncoding:nil error:nil];
         ^ this code should be seen as a Throwing function because it takes a variable to store the error.
         */

        // To compare strings do NOT use ==. Instead do this
        BOOL isOutputEqualToOutput2 = [output isEqualToString:output2];
        NSLog(@"is the output variable equal to the output2 variable: %d", isOutputEqualToOutput2);
        NSLog(@"is the output variable equal to the output2 variable: %@", isOutputEqualToOutput2 ? @"YES": @"NO");

        // NSStrings are immutable, but you can always change the memory address of the string to change the value by pointing to a different string in memory

        // This is a terrible way of creating a mutable string becasue the @"..." formatting is for NSString, NOT NSMutableString
        // NSString is a subset of NSMutable string so putting an NSMutableString inside of an NSString is technically safe, but htis is dumb because
        // it is supposed to be an immutable string, but instead it is mutable.
//        NSMutableString *mutable = @"Hello";

        // Instead, to create a mutable string we do it from a copy of an immutable one using the nutableCopy intializing method
        NSMutableString *hello = [@"Hello" mutableCopy];
        NSLog(@"%@", hello);

        // We can also specify the size of string. Ex. 4096 characters
        NSMutableString *longString = [NSMutableString stringWithCapacity:4096];
        // Set the value of this mutable string
        [longString setString:@"My name is JD"];
        NSLog(@"%@", longString);

        // As said above, it works to set an NSString equal to an NSMutable string, but it creates a mutable string that is supposed to be immutable which is bad
        NSMutableString *first = [@"My string" mutableCopy];
        NSString *second = first;
        NSLog(@"%@", second);
        NSLog(@"%p", second);
        [first setString:@"Something else"];
        NSLog(@"%@", second);
        NSLog(@"%p", second);
        // The second string shouldn't change but it goes from "My string" to "Something else" while keeping the same memory address

        // Instead we should have taken a copy of first;
        NSMutableString *third = [@"My string" mutableCopy];
        NSString *fourth = [third copy];
        [third setString:@"Something else"];
        NSLog(@"%@", fourth);


        // Create a CGRect which is a struct
        CGRect rect = CGRectMake(5, 10, 20, 30);
        NSString *rectString = NSStringFromRect(rect);
        NSLog(@"Our CGRect looks like this when printed: %@", rectString);
    }
    return 0;
}
