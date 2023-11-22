//
//  SCApp.h
//  SwiftyCommits
//
//  Created by Jonathan Paul on 11/21/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SCApp : NSObject

- (void)fetchCommitsForRepo:(NSString*)repo;
@end

NS_ASSUME_NONNULL_END
