//
//  NSString+Trimming.m
//  CategoriesAndClassExtensions
//
//  Created by Jonathan Paul on 11/5/23.
//

#import "NSString+Trimming.h"

@implementation NSString (Trimming) // The title of the categoy "Trimming" is useless. It could be anything and the code would still compile

- (NSString*)jp_stringByTrimming {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

@end
