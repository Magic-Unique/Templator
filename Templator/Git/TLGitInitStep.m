//
//  TLGitInitStep.m
//  Templator
//
//  Created by 吴双 on 2020/3/4.
//

#import "TLGitInitStep.h"

@implementation TLGitInitStep

- (NSString *)title {
    return @"Init first commit";
}

- (void)main:(MUPath *)path invoker:(id<TLInvoker>)invoker {
    NSString *git = @"/usr/bin/git";
    CLLaunch(path.string, git, @"init", nil);
    CLLaunch(path.string, git, @"add", @".", nil);
    CLLaunch(path.string, git, @"commit", @"-m", self.commitMessage?:@"Init Project", nil);
}

@end
