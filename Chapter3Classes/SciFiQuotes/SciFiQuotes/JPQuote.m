//
//  JPQuote.m
//  SciFiQuotes
//
//  Created by Jonathan Paul on 11/6/23.
//

#import "JPQuote.h"

@implementation JPQuote

- (instancetype)initFromLine:(NSString *)line {
    if (self = [super init]) {
        NSArray<NSString *> *components = [line componentsSeparatedByString:@"/"];

        if ([components count] != 2) {
            return nil;
        }
        self.quote = components[0];
        self.speaker = components[1];
    }
    return self;
}

@end
