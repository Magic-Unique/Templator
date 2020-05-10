//
//  TLOpenStep.m
//  Templator
//
//  Created by 吴双 on 2020/3/4.
//

#import "TLOpenStep.h"

@implementation TLOpenStep

- (NSString *)title {
    return @"Open in Xcode.app";
}

- (void)main:(MUPath *)path invoker:(id<TLInvoker>)invoker {
    MUPath *file = self.findFile(path);
    if (file) {
        NSMutableArray *arguments = [NSMutableArray array];
        [arguments addObject:@"/usr/bin/open"];
        [arguments addObject:file.string];
        if (self.application) {
            [arguments addObject:@"-a"];
            [arguments addObject:self.application];
        }
        CLLaunch(nil, arguments, nil);
    }
}

@end
