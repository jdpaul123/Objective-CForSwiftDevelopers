//
//  main.m
//  PropertiesContinued
//
//  Created by Jonathan Paul on 11/5/23.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *person = [Person new];
        person.name = @"Taylor";
        [person printGreeting];
    }
    return 0;
}
