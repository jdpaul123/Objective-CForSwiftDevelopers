//
//  Person.m
//  IntroductionToClasses
//
//  Created by Jonathan Paul on 11/4/23.
//

#import "Person.h"

@implementation Person

- (void)printGreeting {
    NSLog(@"Hello!");
}

// Passing a parameter
- (void)printGreeting:(NSString*)greeting {
    NSLog(@"Hello, %@", greeting);
}

// Including first parameter name in function title and a second parameter
- (void)printGreetingTo:(NSString*)name atTimeOfDay: (NSString*)time {
    if ([time isEqualToString:@"morning"]) {
        NSLog(@"Good morning, %@", name);
    } else {
        NSLog(@"Good evening, %@", name);
    }
}

// Returning multiple values using a dictionary
- (NSDictionary*)fetchGreetingTo:(NSString*)name atTimeOfDay:(NSString*)time {
    if ([time isEqualToString:@"morning"]) {
        return @{
            @"English": [NSString stringWithFormat:@"Good morning, %@", name],
            @"French": [NSString stringWithFormat:@"Bonjour, %@", name]
        };
    }else {
        return @{
            @"English": [NSString stringWithFormat:@"Good evening, %@", name],
            @"French": [NSString stringWithFormat:@"Bonsoir, %@", name]
        };
    }
}

// TODO: You can also use pointer pointers to get multiple values out of a function, but I am a bit confused how that works. IK we use pointer pointers for errors so as to avoid allocating storage for an error that may or may not ever exist

@end
