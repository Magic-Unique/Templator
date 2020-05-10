//
//  TLCreator+Git.h
//  Templator
//
//  Created by 吴双 on 2020/3/4.
//

#import "TLCreator.h"
#import "TLGitCloneStep.h"

@interface TLCreator (Git)

- (void)addGitCloneStep:(void (^)(TLGitCloneStep *step))block;

- (void)addGitClone:(NSString *)url branch:(NSString *)branch;

@end
