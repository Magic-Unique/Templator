//
//  TLStep.m
//  Templator
//
//  Created by 吴双 on 2020/3/4.
//

#import "TLStep.h"

@interface TLBlockStep : TLStep

@property (nonatomic, copy) void (^block)(MUPath *path, id<TLInvoker> invoker);

@end



@implementation TLStep

+ (instancetype)step:(NSString *)title block:(void (^)(MUPath *, id<TLInvoker>))block {
    TLBlockStep *step = [TLBlockStep new];
    step.block = block;
    step.title = title;
    return step;
}

- (void)main:(MUPath *)path invoker:(id<TLInvoker>)invoker {
    
}

@end

@implementation TLBlockStep

- (void)main:(MUPath *)path invoker:(id<TLInvoker>)invoker {
    if (self.block) {
        self.block(path, invoker);
    }
}

@end
