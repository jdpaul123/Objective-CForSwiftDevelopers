//
//  main.m
//  Dictionaries
//
//  Created by Jonathan Paul on 11/3/23.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /*
         NSDictionary is unordered like in Swift. Looping over it will not always have the same order.
         You can create an NSDictionary using lteral syntax. use @{ to start it.
         */
        // MARK: Creating dictionary
        NSDictionary *ships = @{
            @"Serenity": @"Firefly",
            @"Enterprise": @"Star Trek",
            @"Executor": @"Star Wars"
        };
        // To create one the old way with the initializer you input each key/value in the order "value, key, value, key, value, key..., nil"
        NSDictionary *shipsOldWay = [NSDictionary dictionaryWithObjectsAndKeys:
                                         @"Firefly", @"Serenity",
                                     @"Star Trek", @"Enterprise",
                                     @"Star Wars", @"Executor",
                                     nil
        ];
        NSLog(@"ships dictionary contains: %@\nshipsOldWay dictionary contains: %@", ships, shipsOldWay);

        // MARK: Reading values
        for (NSString *key in ships) {
            NSLog(@"The ship %@ features in %@", key, ships[key]);
        }

        NSLog(@"\n");

        for (NSString *key in ships) {
            NSLog(@"The ship %@ features in %@", key, [ships objectForKey:key]);
        }
    }
    return 0;

    /*
     MARK: NSMutableDictionary
     You can create one using the dedicated intializers or the mutableCopy method on a regular dictionary to get a mutable copy of it
     */

    // Because there are no tuples in Obj-C you use NSDictionary when you want to return multiple values from a function

    /*
     MARK: Useful methods
     count -> Returns the number of items in the dict
     allKeys -> Returns array of keys
     allValues -> Returns array of values
     enumerateKeysAndObjectsUsingBlock -> Just like the equivalent method for NSArray
     */
}
