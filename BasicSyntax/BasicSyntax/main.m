//
//  main.m
//  BasicSyntax
//
//  Created by Jonathan Paul on 11/2/23.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int i = 10; // Variables are variable by default (must include const for constant)
        // In obj-c all objects must be pointers, and NSStrings are objects. So, we need to include a pointer *
        NSString *str = @"Reject common sense to make the impossible possible!";
        NSArray *array = @[@"Hello", @"World"];
        
        if (i == 10) {
            NSLog(@"Hello, World!");
        } else {
            NSLog(@"Goodbye!");
        }

        // For one-line statements you can omit the curly braces
        if (i == 10)
            NSLog(@"Hello, World!");
        else
            NSLog(@"Goodbye!");

        i = 20;
        switch (i) {
            case 20:
            {
                int foo = 1; // If you declare a varable in the first line you need curly braces around the block
                NSLog(@"It's 20!");
                break;
            }
            case 40:
                NSLog(@"It's 40!");
                int foo = 1;
                break;
            case 60:
                i = 10;
                NSLog(@"It's 60!");
                break;
            default:
                NSLog(@"It's something else");
        }

        NSArray *names = @[@"Laura", @"Janet", @"Kim"];
        for (NSString *name in names) {
            NSLog(@"Hello, %@", name); // %@ means "the contents of an object"
        }

        for (int i = 1; i <= 5; ++i) {
            NSLog(@"%d*%d is %d", i, i, i * i);
        }

        // To call a method in Swift: myObject.method1().method2()
        // in Obj-c its [[myobject method1] method2] balancing brackets to the left
        // ex. MyObject *myObject = [[MyObject alloc] init];
        // ^ here alloc runs first then init is run to place a default value into the object

        // To create Niil coalescing you can use the ternary operator ? as Obj-c doesn't have ?? like in Swift
        NSString *name = nil;
        NSLog(@"Hellow, %@!", name ?: @"Anonymous");

        NSString *first = @"Hello";
        NSLog(@"%p", first);
        first = @"World";
        NSLog(@"%p", first);
        // To make the first string actually contatant you must write: NSString * const first = @"Hello";
        // The "const" comes right before the "first" rather than anywhere else to ensure the pointer value that "first" stores cannot be changed

        NSLog(@"%f", M_PI);

        NSInteger b = 10;
        NSLog(@"%ld", (long)b);
        NSLog(@"%d", (int)b);
    }
    return 0;
}
