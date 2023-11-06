//
//  Person.m
//  CreatingObjects
//
//  Created by Jonathan Paul on 11/5/23.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithName:(NSString *)name {
    // The if statement below says: "try to make me an instance of my super class, and if that succeeds then I'll initialize my own properties."
    if (self = [super init]) {
        self.name = name;
    }
    return self;
}


- (void)printGreeting {
    NSLog(@"Hello %@", self.name);
}
@end
