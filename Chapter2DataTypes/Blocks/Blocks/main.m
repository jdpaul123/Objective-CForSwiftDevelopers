//
//  main.m
//  Blocks
//
//  Created by Jonathan Paul on 11/3/23.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /*
         Here is a swift closure:
         let printUniversalGreeting = {
            print("Bah-weep-graaaaagnah wheep nini bong")
         }

         printUniversalGreeting()
         */
        // Here it is in Objective-C
        void (^printUniversalGreeting)(void) = ^{
            NSLog(@"Bah-weep-graaaaagnah wheep nini bong");
        };

        printUniversalGreeting();
        /*
         Breaking it down

         void: The block returns nothing.
         (^printUniversalGreeting): Put the block into a variable called "printUniversalGreeting"
         (void): The block accepts no parameters.
         ^{...}: The contents of the block.
         */

        // Example 2:
        NSString* (^printUniversalGreeting2)(NSString *) = ^(NSString *name) {
            return [NSString stringWithFormat:@"Live long and prosper, %@", name];
        };

        NSLog(@"%@", printUniversalGreeting2(@"JD"));

        /*
         Breaking it down

         NSString*: The block will return a string.
         (^printUniversalGreeting2): It's called "printUniversalGreeting".
         (NSString *): It accepts a string
         = ^: Assign the following block to the variable.
         (NSString *name): This is the string variable that the block accepts as stated in (NSString *) and it is called "name"
         */

        // Example 2 split into seperate parts

        // declare the variable
        NSString* (^printUniversalGreeting3)(NSString *);

        // assign it a block to run
        printUniversalGreeting3 = ^(NSString *name) {
            return [NSString stringWithFormat:@"Live long and prosper, %@.", name];
        };

        // now run it and print the result
        NSLog(@"%@", printUniversalGreeting3(@"Jim"));

        // assign a different block to run
        printUniversalGreeting3 = ^(NSString *name) {
            return [NSString stringWithFormat:@"Nanu Nanu, %@!", name];
        };

        // now run it again
        NSLog(@"%@", printUniversalGreeting3(@"Josiah"));

        // MARK: typedef
        // Using typedef can make things look cleaner

        typedef NSString* (^MyBlock)(NSString*);

        MyBlock printUniversalGreeting4 = ^(NSString *name) {
            return [NSString stringWithFormat:@"Live long and prosper, %@.", name];
        };
        NSLog(@"%@", printUniversalGreeting4(@"JD"));

        // MARK: Capturing values
        // You can modify a variable that is used inside a block from the outside using __block
        // In other words, you can initialize a variable outside of a block and then use it on the inside using __block
        // For example __block NSInteger number = 0; or you can write NSInteger __block number = 0;
        NSInteger __block number = 0;

        NSString* (^printMeaningOfLife)(void) = ^{
            number = 42;
            return [NSString stringWithFormat:@"How many roads must a man walk down? %ld", number];
        };

        NSLog(@"%@", printMeaningOfLife());

        // MARK: Strong reference cycles
        // TODO: What is a capture list in Swift? And how do they make strong reference cycles less ikely? -> Answer: it is [weak self] or [unowned self]
        // For Objective-C, to avoid a strong reference cycle you use a __weak qualifier
        /*
         MyViewController * __weak weakFelf = self;

         NSString* (^myBlock)(void) = ^{
            return [weakSelf runSomeMethod];
         };
         */
    }
    return 0;
}
