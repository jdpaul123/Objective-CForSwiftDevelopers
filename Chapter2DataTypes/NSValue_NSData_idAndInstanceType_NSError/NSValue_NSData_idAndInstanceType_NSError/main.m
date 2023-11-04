//
//  main.m
//  NSValue_NSData_idAndInstanceType_NSError
//
//  Created by Jonathan Paul on 11/3/23.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // MARK: NSValue
        /*
         CGRect, CGSize, and CGPoint are all structs in Objective-C. Therefor, they will not fit in collections like Arrays or Dicitonaries.
         To remedy this, Apple creaed the NSValue generic wrapper to wrap these structs so they can be put into collection and be more useful.
         NSValue is "a gigantic hack, to be honest, but it's one we're all stuck with"
         */

        // This creates NSValues that wrap a Rect, Point, and Size struct instance
//        NSValue *rect = [NSValue valueWithRect:NSMakeRect(0, 0, 10, 10)];
//        NSValue *point = [NSValue valueWithPoint:NSMakePoint(0, 0)];
//        NSValue *size = [NSValue valueWithSize:NSMakeSize(10, 10)];

        // MARK: NSData
        // This class is equivalent to Swift's Data class

        // MARK: NSObject
        /*
         Every class inherits from NSObject
         ex. UIViewController inherits from UIResponder which in turn inherits from NSObject.
         In Swift you generally don't have to inherit from NSObject unless your class uses thigns like NSCoding which you must get from subclassing NSObject.
         NSObject is both a class and a protocol
         NSObject provides the copy and mutableCopy methods
         isKindOfClass returns true if an object is a specific type, or subclass of that type. ex. [SomeClass class] for the parameter
         conformsToProtocol returns true if an object declares itself conforming to a protocol
         respondsToSelector checks whether an object is able to run a method.
         performSelector runs a method on an object.
         */

        NSMutableArray *people = [@[@"Taylor Swift", @"Adele Adkins"] mutableCopy];
        // If the type of "people" is an NSArray and it has the method of "removeAllObjects" then it will call "removeAllObjects" on "people"
        // NSMutableArray is a subclass of NSArray so this works
        if ([people isKindOfClass:[NSArray class]]) {
            if ([people respondsToSelector:@selector(removeAllObjects)]) {
                [people performSelector:@selector(removeAllObjects)]; // TODO: I am still confused about why performSelector exists when we could just call the method directly ie. [people removeAllObjects];
            }
        }

        // MARK: id and instancetype
        // id is a data type which means "any pointer Objective-C object"
        // id used to be the data type used for items in arrays and dictionaries so the Obj-C compiler will not warn you when you convcert between id and any other data type.
        // This made development easier becasue you did not need to typecast things coming out of arrays constantly.
        // An item coming out of an array was just of type id and that id could be any type. I can see why this could cause so many bugs! Seems unsafe.
        // Because id could be any type you can also call methods from any type on it. If you call a method on an id object that is not actually a type
        // that has that method then you will get a runtime error and crash!
        NSArray *foo = [NSArray new];
        id bar = foo; // putting foo into an id type object bar means that the object looses its identity as an NSArray
        NSArray *baz = bar; // This causes no errors becasue the compiler will let you cast id to any type. It just may crash at runtime if it is the wrong type
        NSLog(@"%@", baz);

        // Until 2012 many initializers returned id type objects instead of the type that the instance is
        NSSet *someSet = [NSSet setWithObjects:@"This", nil]; // used to return id rather than NSSet.
        NSLog(@"%@", someSet);
        // Now, Apple created instancetype which is a special keyword that means that an instance of the intended type will be returned.
        // Apple has updated all of their APIs! Good good

        // MARK: NSError
        // This type is used to report errors back from function calls that fail. This is just like throwing functions in Swift, but less in your
        // face about having to handle the error
        NSError *error;
        NSLog(@"The address of error is %p", error);
        NSLog(@"The error message is: %@", [error localizedDescription]); // This will print nothign for the localized description becasue the NSError does not yet exist
        NSString *contents = [NSString stringWithContentsOfFile:@"hello.txt" usedEncoding:nil error:&error];
        NSLog(@"Now the address of error is %p", error);
        NSLog(@"Now the error message is: %@", [error localizedDescription]);
        // Here we pass a pointer to the pointer that points to the memory location of the NSError called error
        // Rather than create memory space for an entire NSError
        // we can point to an address that can be changed to point to an NSError IF an error ends up ocurring.
        // &error says "take the address of where the address is stored that points to our uninitialized NSError (ie. the memory for the NSError is not yet reserved or assigned)"
    }
    return 0;
}
