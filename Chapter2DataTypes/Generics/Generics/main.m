//
//  main.m
//  Generics
//
//  Created by Jonathan Paul on 11/3/23.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /*
         Generics were added to Objective-C after Swift was announced in order to align with Swift's generics.
         Unfortunately, in Objective-C, they are only syntacitic sugar that helps when coding, but is discarded at build time.
         */

        NSMutableArray<NSString *> *names = [NSMutableArray arrayWithCapacity:4];
        [names addObject:@"Sophie"];
        // Here, Xcode can be smart enough to warn us that this is wrong
//        [names addObject:@42];
        // Xcode will also warn you if you try and read a value with the wrong type
//        NSNumber *number = names[0];

        // We can use NSArray<NS Number *> to create a generic type specification.
        // This will compile but crash at runtime becasue we are trying to make NSStrings out of NSNumbers.
        // Unlike Swift, this will compile despite looking like something that should cause the code to NOT even compile
        // This is what it would look like without the generic definition: NSArray *numbers = @[@42, @556, @69, @3.141];
        NSArray<NSNumber *> *numbers = @[@42, @56, @69, @3.141];
        for (NSString *number in numbers) {
//            NSLog(@"%@", number); // I include this line to show that it works if you change the NSString * above to NSNumber *
            NSLog(@"%@ is %ld letters.", number, [number length]);
        }

        // MARK: TLDR
        // Generics are pretty useless. They aren't benegicial like in Swift and they are relatively new so they are not used in many projects
    }
    return 0;
}
