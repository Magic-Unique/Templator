//
//  TLCreator.m
//  Templator
//
//  Created by 吴双 on 2020/3/4.
//

#import "TLCreator.h"

@interface TLCreator ()

@property (nonatomic, strong, readonly) NSMutableArray *mSteps;

@end

@implementation TLCreator

- (void)addStep:(TLStep *)step {
    [self.mSteps addObject:step];
}

- (void)create:(MUPath *)path {
    if (path.isExist) {
        CLError(@"The path `%@` has exist.", path.lastPathComponent);
        return;
    }
    NSMutableDictionary *input = [NSMutableDictionary dictionary];
    NSMutableDictionary *output = [NSMutableDictionary dictionary];
    NSMutableDictionary *env = [NSMutableDictionary dictionary];
    for (TLStep *step in self.steps) {
        input = output;
        output = [NSMutableDictionary dictionary];
        TLInvoker *invoker = [TLInvoker invoker:env input:input output:output];
        

        NSString *title = step.title;
        CLLoading *loading = [CLLoading loading];
        loading.text = title ?: @"Waiting...";
        [loading start];
        
        [step main:path invoker:invoker];
        
        [loading stop];
//        CLSuccess(@"> %@", title);
        CLInfo(@"%@ %@", CCText(CCStyleForegroundColorGreen, @">"), title ?: @"Done");
    }
}

- (NSArray<TLStep *> *)steps {
    return [self.mSteps copy];
}

@synthesize mSteps = _mSteps;
- (NSMutableArray *)mSteps {
    if (!_mSteps) {
        _mSteps = [NSMutableArray array];
    }
    return _mSteps;
}

@end
