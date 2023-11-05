//
//  main.m
//  IntroductionToClasses
//
//  Created by Jonathan Paul on 11/4/23.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *person = [Person new];
        [person printGreeting];
        // You can also call the printGreeting method by writing:
        [person performSelector:@selector(printGreeting)];
        // However if Person did not have a method named printGreeting, but another class that we import did, for example a class called Dog with a printGreeting method,
        // then Xcode would call printGreeting on person without any warnings. Since, in this hypothetical, Person does not have a method/@selector called "printGreeting"
        // the program would crash
        [person printGreeting:@"Welcome!"];

        [person printGreetingTo:@"JD" atTimeOfDay:@"evening"];

        // Calling a method that takes parametors using a selector
        [person performSelector:@selector(printGreeting:) withObject:@"Taylor"];
        // Now two parameters
        [person performSelector:@selector(printGreetingTo:atTimeOfDay:) withObject:@"Taylor" withObject:@"morning"];
        // If there gets to be more, you must pass a dictionary with the arguments that can be unpacked by the function
    }
    return 0;
}
