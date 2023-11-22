//
//  SCApp.m
//  SwiftyCommits
//
//  Created by Jonathan Paul on 11/21/23.
//

#import "SCApp.h"

@implementation SCApp

- (void)fetchCommitsForRepo:(NSString *)repo {
    // MARK: Get the JSON data from the url
    NSString *urlString = [NSString stringWithFormat:@"https://api.github.com/repos/%@/commits", repo];
    NSURL *url = [NSURL URLWithString:urlString];

    NSError *error;
    NSData *data = [NSData dataWithContentsOfURL:url options:NSDataReadingUncached error:&error];

    if (error != nil) {
        NSLog(@"Fatal error 1:%@", [error localizedDescription]);
        exit(0);
    }

    // MARK: Parse the JSON data
    // decode the NSData into an array of dictionaries
    NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];

    // if there was an error, bail out
    if (error != nil) {
        NSLog(@"Fatal error 2: %@", [error localizedDescription]);
        exit(0);
    }

    // loop through each dictionary in the array
    for (NSDictionary *entry in json) {
        // pull interesting data into variables
        NSString *name = entry[@"commit"][@"author"][@"name"];
        NSString *message = entry[@"commit"][@"message"];

        // remnove line breaks for easier reading
        message = [message stringByReplacingOccurrencesOfString:@"\n" withString:@" "];

        // print it all out
        printf("%s: %s\n\n", [name cStringUsingEncoding:NSUTF8StringEncoding], [message cStringUsingEncoding:NSUTF8StringEncoding]);
    }
}
@end
