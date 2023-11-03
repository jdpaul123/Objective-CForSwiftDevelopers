//
//  main.m
//  Sets
//
//  Created by Jonathan Paul on 11/3/23.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /*
         Classes for creating sets:
         NSSet
         NSMutableSet
         NSCountedSet <- automatically mutable

         NSSet is much like in Swift with methods like count, containsObject, and intersectsSet
         */

        NSSet *odd = [NSSet setWithObjects:@1, @3, @5, @7, @9, nil]; // Alternatively, create a set from an array with "setWithArray"
        NSSet *even = [NSSet setWithObjects:@2, @4, @6, @8, @10, nil];
        NSSet *combined = [odd setByAddingObjectsFromSet:even];
        NSMutableSet *mutable = [combined mutableCopy];
        [mutable addObject:@0];
        [mutable removeAllObjects];

        // MARK: CountedSet
        /*
         The NSCountedSet will tell you how many times a value has shown up. 
         So if you initialize it with two copys of the integer, 6, then the countForObject:6 method would return 2
         */
        NSCountedSet *numbers = [NSCountedSet setWithObjects: @1, @3, @2, @8, @3, @6, @8, @8, @5, @1, @6, @3, nil];

        for (NSString *value in [numbers allObjects]) {
            NSLog(@"%@ appears %ld times", value, [numbers countForObject:value]);
        }
    }
    return 0;
}
