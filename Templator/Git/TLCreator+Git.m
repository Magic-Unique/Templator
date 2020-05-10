//
//  TLCreator+Git.m
//  Templator
//
//  Created by 吴双 on 2020/3/4.
//

#import "TLCreator+Git.h"

@implementation TLCreator (Git)

- (void)addGitCloneStep:(void (^)(TLGitCloneStep *))block {
    TLGitCloneStep *step = [TLGitCloneStep new];
    block(step);
    [self addStep:step];
}

- (void)addGitClone:(NSString *)url branch:(NSString *)branch {
    [self addGitCloneStep:^(TLGitCloneStep *step) {
        step.gitURL = url;
        step.branch = branch;
    }];
}

@end
