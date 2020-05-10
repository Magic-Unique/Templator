//
//  TLCreator+Replacement.h
//  Templator
//
//  Created by 吴双 on 2020/3/4.
//

#import "TLCreator.h"
#import "TLReplaceStep.h"

@interface TLCreator (Replacement)

- (void)addReplaceStep:(void (^)(TLReplaceStep *step))block;

@end
