//
//  Person.h
//  CreatingObjects
//
//  Created by Jonathan Paul on 11/5/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
@property NSString *name;
- (void)printGreeting;
- (instancetype)initWithName:(NSString *)name;
@end

NS_ASSUME_NONNULL_END
