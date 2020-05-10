//
//  TLInvoker.m
//  Templator
//
//  Created by 吴双 on 2020/3/4.
//

#import "TLInvoker.h"

@implementation TLInvoker

+ (instancetype)invoker:(NSMutableDictionary *)env
                  input:(NSMutableDictionary *)input
                 output:(NSMutableDictionary *)output {
    TLInvoker *invoker = [self new];
    invoker.env = env;
    invoker.input = input;
    invoker.output = output;
    return invoker;
}

- (instancetype)init {
    if (self) {
        _isSuccess = YES;
    }
    return self;
}

- (void)setEnv:(NSMutableDictionary *)env {
    _env = env;
}

- (void)setInput:(NSMutableDictionary *)input {
    _input = input;
}

- (void)setOutput:(NSMutableDictionary *)output {
    _output = output;
}

- (void)failure {
    _isSuccess = NO;
}

- (void)success {
    _isSuccess = YES;
}

@end
