//
//  JPQuote.h
//  SciFiQuotes
//
//  Created by Jonathan Paul on 11/6/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JPQuote : NSObject

@property NSString *speaker;
@property NSString *quote;

- (nullable instancetype)initFromLine:(NSString *)line;

@end

NS_ASSUME_NONNULL_END
