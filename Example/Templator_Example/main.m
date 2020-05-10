//
//  main.m
//  Templator_Example
//
//  Created by 吴双 on 2020/3/4.
//  Copyright © 2020 冷秋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Templator/Templator.h>
#import <CommandLine/CommandLine.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        TLCreator *creator = [TLCreator new];
        [creator addStep:({
            TLGitCloneStep *clone = [TLGitCloneStep new];
            clone.gitURL = @"git@gitee.com:pica/MUHookTemplate.git";
            clone.branch = @"0.1.0";
            clone;
        })];
        [creator addStep:({
            TLReplaceStep *replace = [TLReplaceStep new];

            NSString *appBundleName = @"WeChat";
            NSString *appBundleId = @"com.tencent.xin";
            NSString *appBundleShortVersion = @"6.0.0";
            NSString *appBundleVersion = @"1000";
            NSString *MinimumOSVersion = @"9.0";
            
            [replace replace:@"" to:@""];
            [replace replace:@"MUH-APP-NAME" to:appBundleName];
            [replace replace:@"MUH-FRAMEWORK-NAME" to:[NSString stringWithFormat:@"%@Plugin", appBundleName]];
            [replace replace:@"MUH_FRAMEWORK_NAME" to:[NSString stringWithFormat:@"%@Plugin", appBundleName]];
            [replace replace:@"MUH-APP-BUNDLE-IDENTIFIER" to:appBundleId];
            [replace replace:@"MUH-APP-BUNDLE-SHORT-VERSION" to:appBundleShortVersion];
            [replace replace:@"MUH-APP-BUNDLE-VERSION" to:appBundleVersion];
            [replace replace:@"MUH-USER" to:NSUserName()];
            [replace replace:@"MUH-ORGANIZATION-IDENTIFIER" to:[NSString stringWithFormat:@"com.%@", NSUserName()]];
            [replace replace:@"MUH-ORGANIZATION-NAME" to:NSFullUserName()];
            [replace replace:@"IPHONEOS_DEPLOYMENT_TARGET = 13.2;" to:[NSString stringWithFormat:@"IPHONEOS_DEPLOYMENT_TARGET = %@;", MinimumOSVersion]];

            NSDate *date = [NSDate date];
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            dateFormatter.dateFormat = @"yyyy/MM/dd";
            [replace replace:@"MUH-TIME-YEAR-MONTH-DAY" to:[dateFormatter stringFromDate:date]];
            dateFormatter.dateFormat = @"yyyy";
            [replace replace:@"MUH-TIME-YEAR" to:[dateFormatter stringFromDate:date]];
            
            replace;
        })];
        [creator addStep:({
            TLPodInstallStep *init = [TLPodInstallStep new];
            init;
        })];
        [creator addStep:[TLStep step:@"" block:^(MUPath *path, id<TLInvoker> invoker) {
            CLLoading *loading = [CLLoading loading];
            loading.text = @"Copy Resources...";
            [loading start];
            MUPath *packages = [path subpathWithComponent:@"Resources/Packages"];
            [packages createDirectoryWithCleanContents:NO];
            MUPath *from = [MUPath pathWithString:@"~/Desktop/calculator/Payload/Packages/Calculator.app"];
            MUPath *target = [packages subpathWithComponent:from.lastPathComponent];
            [from copyTo:target autoCover:YES];
            [loading stop];
        }]];
        [creator addStep:({
            TLGitInitStep *init = [TLGitInitStep new];
            init;
        })];
        [creator addStep:({
            TLOpenStep *open = [TLOpenStep new];
            open.findFile = ^MUPath *(MUPath *path) {
                MUPath *file = nil;
                if (!file) {
                    file = [path contentsWithFilter:^BOOL(MUPath *content) {
                        return content.isDirectory && [content isA:@"xcworkspace"];
                    }].firstObject;
                }
                if (!file) {
                    file = [path contentsWithFilter:^BOOL(MUPath *content) {
                        return content.isDirectory && [content isA:@"xcodeproj"];
                    }].firstObject;
                }
                return file;
            };
            open;
        })];
        [creator create:[MUPath pathWithString:@"~/templator"]];
    }
    return 0;
}
