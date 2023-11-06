//
//  main.m
//  CreatingObjects
//
//  Created by Jonathan Paul on 11/5/23.
//
// MARK: This project is started from a copy of the Properties project

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Note: You can write as many init... methods as you want, but you never
        // write a custom alloc method. NSObject handles that for you.
        Person *person = [[Person alloc] initWithName:@"JD"];
        [person printGreeting];
    }
    return 0;
}
