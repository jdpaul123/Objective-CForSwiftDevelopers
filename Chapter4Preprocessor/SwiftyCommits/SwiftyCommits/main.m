//
//  main.m
//  SwiftyCommits
//
//  Created by Jonathan Paul on 11/21/23.
//

#import <Foundation/Foundation.h>
#import "SCApp.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *repo = @"apple/swift";

        if (argc == 2) {
            repo = [NSString stringWithCString:argv[1] encoding:NSUTF8StringEncoding];
        }

        NSArray<NSString*> *splitRepoString = [repo componentsSeparatedByString:@"/"];
        if (splitRepoString.count != 2 || [(NSString *)splitRepoString[0] length] <= 0 || [(NSString *)splitRepoString[1] length] <= 0) {
            NSLog(@"The format for the repo argument should be a path two directories deep. Example: \"apple/swift\"");
            NSLog(@"%@", splitRepoString);
            exit(0);
        } else {
            NSLog(@"%@", splitRepoString);
        }

        SCApp *app = [SCApp new];
        [app fetchCommitsForRepo:repo];
    }
    return 0;
}
