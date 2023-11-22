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
        NSString *userName = @"";

        // If there are 2 erguments passed (ie. argc == 3) then the first argument is the path after the username and
        // the second argument is the user name which is the first item in the path
        // (ie. "apple" is the user name in "apple/swift")
        if (argc == 2) {
            repo = [NSString stringWithCString:argv[1] encoding:NSUTF8StringEncoding];
        } else if (argc == 3) {
            repo = [NSString stringWithCString:argv[1] encoding:NSUTF8StringEncoding];
            userName = [NSString stringWithCString:argv[2] encoding:NSUTF8StringEncoding];
            repo = [NSString stringWithFormat:@"%@/%@", userName, repo];
        }
        NSLog(@"The input path is %@", repo);

        // Only try to get the data if we have a valid forward slash separated path
        NSArray<NSString*> *splitRepoString = [repo componentsSeparatedByString:@"/"];
        if (splitRepoString.count != 2 || [(NSString *)splitRepoString[0] length] <= 0 || [(NSString *)splitRepoString[1] length] <= 0) {
            NSLog(@"The format for the repo argument should be a path two directories deep. Example: \"apple/swift\"");
            NSLog(@"%@", splitRepoString);
            exit(0);
        }

        SCApp *app = [SCApp new];
        [app fetchCommitsForRepo:repo];
    }
    return 0;
}
