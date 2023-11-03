//
//  main.m
//  Arrays
//
//  Created by Jonathan Paul on 11/3/23.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *villains = @[@"Weeping Angels", @"Cybermen", @"Daleks", @"Vashta Nerada"];

        for (NSString *villain in villains) {
            NSLog(@"Can the Doctor defeat the %@? Yes he can!", villain);
            Class objectClass = [villain class];
            NSLog(@"Type of object: %@", NSStringFromClass(objectClass));
        }
        Class villainsClass = [villains class];
        NSLog(@"Type of the array: %@", NSStringFromClass(villainsClass));

        // Before creating arrays using array literals was created you had to use initializers
        // You must end the arguments with a "nil"
        NSArray *villains2 = [NSArray arrayWithObjects:@"Weeping Angels", @"Cybermen", @"Daleks", @"Vashta Nerada", nil];
        NSLog(@"%@", villains2);

        // Go through the array in reverse
        for (NSString *villain in [villains reverseObjectEnumerator]) {
            NSLog(@"Can the Doctor defeat the %@? Yes he can!", villain);
        }

        // Print at a certain index
        NSLog(@"The %@ are my favorite villains.", villains[2]);

        // The old way of printing at an index
        NSLog(@"The %@ are my favorite villains.", [villains objectAtIndex:2]);

        // Print the count
        NSLog(@"The doctor faced %lu villains in that episode.", [villains count]);

        // Since optionals don't exist, if the object cannot be found the function returns a constant value NSNotFound which equals 9,223,372,036,854,775,807 on 64-bit systems
        NSLog(@"Daleks are villain number %ld.", (long)[villains indexOfObject:@"Daleks"]);

        NSLog(@"The second villain was the %@.", [villains objectAtIndex:1]);

        NSLog(@"The Doctor conquered these villains: %@.", [villains componentsJoinedByString:@", "]);

        // MARK: Mutable arrays
        NSMutableArray *villainsMutable = [villains mutableCopy];
        NSLog(@"The contents of villainsMutable is %@", villainsMutable);
        NSLog(@"The address of villains is: %p\nThe address of viallainsMutable is: %p", villains, villainsMutable);
        [villainsMutable insertObject:@"The Silence" atIndex:1];
        NSLog(@"After inserting \"The Silence\" at index 1 contents of villainsMutable is %@", villainsMutable);
        [villainsMutable removeObjectAtIndex:3];
        NSLog(@"After removing the object at index 3 the contents of villainsMutable is %@", villainsMutable);
        [villainsMutable removeAllObjects];
        NSLog(@"After removing everything, the contents of villainsMutable is %@", villainsMutable);
        villainsMutable = [villains mutableCopy];
        NSLog(@"After setting villainsMutable back to being a copy of the villains array, the contents of villainsMutable is %@", villainsMutable);


        // Anything that uses an index that is outside the length of the array will cause a crash


        // We use NSStrings built-in method called "compare" along with the "sortedArrayUsingSelector" method to sort an array
        NSArray *sorted = [villains sortedArrayUsingSelector:@selector(compare:)];
        NSLog(@"The sorted villains array looks like this: %@", sorted);

        // MARK: 3 useful functional-programming--like methods
        /*
         makeObjectsPerformSelector <- runs a method on every element in the array
         enumerateObjectsUsingBlock <- blocks are like proto-closures from Swift
         filteredArrayUsingPredicate <- this "predicate" is like the one CoreData. It is used for filtering functionality like Swift's filter() method
         */

        // Here is an example of a block. The captured values are mutable by default whereas Swift's are copied.
        // The obj parameter has the data type "id" which is Obj-C's version of Swift's AnyObject. It is set to an item in the array
        // idx is the position of the current item in the array - it's short for "index"
        // We have a pointer to a boolean. This boolean will say "stop the block from running anymore times" if set to true/YES.
        // It is a pointer because a pointer is visible outside of the block. If it were not a pointer to a boolean any code outside the
        // block could not know that the block should stop running becuase it does not know the value of the "stop" parameter
        [villains enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            NSLog(@"Can the Doctor defeat the %@? Yes he can!", obj);
        }];

        NSLog(@"INSERTING THIS LINE TO BREAK UP THE CONSOLE SO IT'S EASIER TO READ");

        [villains enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            if ([obj isEqualToString:@"Cybermen"]) {
                NSLog(@"Can the Doctor defeat the %@? Oh, apparently not.", obj);
                *stop = true;
            } else {
                NSLog(@"Can the Doctor defeat the %@? Yes he can!", obj);
            }
        }];

        /*
         “If you find block syntax difficult to remember, you should take comfort in knowing that http://goshdarnblocksyntax.com/ exists.”

         Excerpt From
         Objective-C for Swift Developers
         Paul Hudson
         This material may be protected by copyright.
         */

        NSLog(@"INSERTING THIS LINE TO BREAK UP THE CONSOLE SO IT'S EASIER TO READ");

        // This returns only villians with at least two words in their name
        // If the return value is true/YES then it will add the object to the value out of the outputted array of new items
        NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(id obj, NSDictionary *bindings) {
            return [[obj componentsSeparatedByString:@" "] count] == 2;
        }];

        NSArray *twoWordVillains = [villains filteredArrayUsingPredicate:predicate];
        for (NSString *villain in twoWordVillains) {
            NSLog(@"This villain has two words in it's name: %@", villain);
        }

        // MARK: Key Paths
        // Rarely ever used. Just good to know they exist
        // In Swift they are used for Key Value Observing (KWO)
        NSArray *numbers = [NSArray arrayWithObjects:@1, @2, @3, @4, @5, nil];
        NSNumber *sum = [numbers valueForKeyPath:@"@sum.self"];
        NSNumber *avg = [numbers valueForKeyPath:@"@avg.self"];
        NSNumber *min = [numbers valueForKeyPath:@"@min.self"];
        NSNumber *max = [numbers valueForKeyPath:@"@max.self"];
        NSLog(@"Total: %ld", (long)[sum integerValue]);
        NSLog(@"Avg: %ld", (long)[avg integerValue]);
        NSLog(@"Min: %ld", (long)[min integerValue]);
        NSLog(@"Max: %ld", (long)[max integerValue]);
    }
    return 0;
}
