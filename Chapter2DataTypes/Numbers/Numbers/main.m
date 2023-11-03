//
//  main.m
//  Numbers
//
//  Created by Jonathan Paul on 11/3/23.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    /* “NSInteger is a series of 1s and 0s that can be either a 32-bit integer or a 64-bit integer depending on the CPU.”
     I don't really think that this is a consideration anymore because the switch to 64-bit is done as far as I know.
     There is also int64_t and Int32_t which enforces the int size despite CPU version
     There is also NSUInteger which is either a 32-bit unsigned int or 64-bit unsigned int depending on the CPU

     Ther is also the Obj-C type NSNumber which is not like NSInteger. NSInteger and other integer types are all primative, but NSNumber is an object.
     NSNumber can hold int, NSInteger, floats, doubles, and even booleans. You can create is as an integer and read it back as a double.
     You CANNOT do math with NSNumbers
     It is only used for storage because Objecitve-C arrays, sets, and dictionaries can only hold objects. So NSNumber is basically a wrapper to make
     primative integers, floats, doubles, bools objects that can go in collections.
     */
    @autoreleasepool {
        NSNumber *ten = [NSNumber numberWithInteger: 10];
        float floatTen = [ten floatValue];
        NSInteger nsIntegerTen = [ten integerValue];
        int intTen = [ten intValue];
        NSLog(@"Here is ten as a float: %f\nHere is ten as an NSInteger: %ld\nHere is ten as an int: %d", floatTen, nsIntegerTen, intTen);
    }
    return 0;
}
