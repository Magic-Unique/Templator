//
//  TLGitCloneStep.m
//  Templator
//
//  Created by 吴双 on 2020/3/4.
//

#import "TLGitCloneStep.h"

@implementation TLGitCloneStep

- (instancetype)init {
    if (self = [super init]) {
        _depth = 1;
    }
    return self;
}

- (NSString *)title {
    return @"Clone template";
}

- (void)main:(MUPath *)path invoker:(id<TLInvoker>)invoker {
    if (path.isExist) {
        [path remove];
    }
    CLLaunch(nil, @"/usr/bin/git", @"clone",
             @"-b", self.branch,
             [NSString stringWithFormat:@"--depth=%@", @(self.depth)],
             self.gitURL,
             path.string,
             nil);
    [[path subpathWithComponent:@".git"] remove];
}

@end
