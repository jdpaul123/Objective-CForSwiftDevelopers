//
//  main.m
//  SciFiQuotes
//
//  Created by Jonathan Paul on 11/6/23.
//

#import <Foundation/Foundation.h>
#import "JPApp.h"

// I did this project almost entirely without the book. I used the internet when I was stuck. I check at the end
// to find out about making the initializer nullable for JPQuote. I then checked my work with Paul Hudson's.
// While reviewing his code I edited my line breaks to match Paul's to practice good structuring of Objective-C files.

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES);
        NSString *desktopPath = [paths objectAtIndex:0];

        JPApp *app = [[JPApp alloc] initWithFile:[desktopPath stringByAppendingPathComponent:@"quotes.txt"]];;
        [app printQuote];
    }
    return 0;
}
