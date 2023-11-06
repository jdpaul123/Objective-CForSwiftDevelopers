//
//  JPApp.m
//  SciFiQuotes
//
//  Created by Jonathan Paul on 11/6/23.
//

#import "JPApp.h"
#import "JPQuote.h"

@implementation JPApp

- (instancetype)initWithFile:(NSString *)filePathString {
    if (self = [super init]) {
        // Load the file contents
        NSError *error = nil; // Paul doesn't set it equal to nil. I think what I do, "= nil", is unneccesary. Habbit.
        NSString *contentOfFile = [NSString stringWithContentsOfFile:filePathString encoding:NSUTF8StringEncoding error:&error]; // Paul sets the encoding to nil here

        if (error != nil) {
            NSLog(@"%@", error.localizedDescription);;
            NSLog(@"Failed to read the quotes.txt file. Ending the program");
            exit(0);
        }

        NSArray *quoteStrings = [contentOfFile componentsSeparatedByString:@"\n"];
        self.quotes = [NSMutableArray arrayWithCapacity:[quoteStrings count]]; // I did copy this arrayWithCapacity from Paul. I originally just initialized it empty
        for (NSString *line in quoteStrings) {
            JPQuote *quote = [[JPQuote alloc] initFromLine:line];
            if (quote != nil) {
                [self.quotes addObject:quote];
            }
        }
    }
    return self;
};
- (void)printQuote {
    if ([self.quotes count] == 0) {
        NSLog(@"There are no quotes loaded in to the program");
        return;
    }
    uint32_t randomIndex = arc4random_uniform((uint32_t)[self.quotes count]); // Paul sets this variable to NSInteger type rather than uint32_t
    JPQuote *quote = [[self quotes] objectAtIndex:randomIndex]; // On this line Paul set the variable equal to this: self.quotes[randomIndex];
    NSLog(@"\"%@\" spoken by %@", quote.quote, quote.speaker);
    /*
     Instead of the NSLog line above, Paul did this:
     printf("%s\n", [selected.text cStringUsingEncoding:NSUTF8StringEncoding]);
     printf("\t – %s\n", [selected.person cStringUsingEncoding:NSUTF8StringEncoding]);

     Where the selected variable is my quote variable
     */
};
@end
