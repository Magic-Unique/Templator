//
//  TLCreator+Replacement.m
//  Templator
//
//  Created by 吴双 on 2020/3/4.
//

#import "TLCreator+Replacement.h"


@implementation TLCreator (Replacement)

- (void)addReplaceStep:(void (^)(TLReplaceStep *step))block {
    TLReplaceStep *step = [TLReplaceStep new];
    block(step);
    [self addStep:step];
}

@end
