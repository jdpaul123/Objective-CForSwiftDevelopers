//
//  Person.m
//  Nullability
//
//  Created by Jonathan Paul on 11/5/23.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithName:(NSString*)name {
    if (self = [super init]) {
        self.name = name;
    }
    return self;
}

- (NSString*)fetchGreetingForTime:(NSString*)time {
//    self.name = nil; // Uncomment this line to see that Xcode will not let us compile the code as long as TREAT WARNINGS AS ERRORS is set to YES
//    _name = nil;  // This will compile fine. Another reason not to access ivars directly

    // The following two lines end up compiling fine becasue the compiler doesn't follow nil values from one line to the next
    // Use the syntactic analyzer to find these kind of null values and other logic errors. On the menu bar click Product>Analyze
//    NSString *str = nil;
//    self.name = str;

    /*
     Turn on the Analyzer for every build
     Go to your build settings and search for “analysis”. Enable “Analyze During Build”,
     and if you’re really intent on catching everything then set “Mode of Analysis for Build” to Deep.”
     */

    return [NSString stringWithFormat:@"Good %@, %@", time, self.name];
}

@end
