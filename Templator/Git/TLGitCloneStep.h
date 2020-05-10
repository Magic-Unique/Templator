//
//  TLGitCloneStep.h
//  Templator
//
//  Created by 吴双 on 2020/3/4.
//

#import "TLStep.h"

@interface TLGitCloneStep : TLStep

@property (nonatomic, strong) NSString *gitURL;

@property (nonatomic, strong) NSString *branch;

@property (nonatomic, assign) NSUInteger depth;

@end
