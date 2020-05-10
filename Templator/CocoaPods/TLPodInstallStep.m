//
//  TLPodInstallStep.m
//  Templator
//
//  Created by 吴双 on 2020/3/4.
//

#import "TLPodInstallStep.h"

@implementation TLPodInstallStep

- (NSString *)title {
    return @"Install CocoaPods";
}

- (void)main:(MUPath *)path invoker:(id<TLInvoker>)invoker {
    if (!CLEnvironment[@"LANG"]) {
        CLEnvironment[@"LANG"] = @"en_US.UTF-8";
    }
    CLLaunch(path.string, @"/usr/local/bin/pod", @"install", nil);
}

@end
