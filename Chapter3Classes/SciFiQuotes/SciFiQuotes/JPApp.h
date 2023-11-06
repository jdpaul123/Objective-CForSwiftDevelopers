//
//  JPApp.h
//  SciFiQuotes
//
//  Created by Jonathan Paul on 11/6/23.
//

#import <Foundation/Foundation.h>
#import "JPQuote.h"

NS_ASSUME_NONNULL_BEGIN

@interface JPApp : NSObject

@property NSMutableArray<JPQuote *> *quotes; // This array holds a bunch of JPQuote objects

- (instancetype)initWithFile:(NSString *)filePathString;
- (void)printQuote;

@end

NS_ASSUME_NONNULL_END
