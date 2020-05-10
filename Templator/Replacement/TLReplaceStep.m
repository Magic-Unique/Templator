//
//  TLReplaceStep.m
//  Templator
//
//  Created by 吴双 on 2020/3/4.
//

#import "TLReplaceStep.h"

@implementation TLReplaceItem @end



@interface TLReplaceStep ()

@property (nonatomic, strong, readonly) NSMutableArray<TLReplaceItem *> *list;

@end

@implementation TLReplaceStep

- (void)replace:(NSString *)origin to:(NSString *)target {
    TLReplaceItem *item = [TLReplaceItem new];
    item.origin = origin;
    item.target = target;
    [self.list addObject:item];
}

- (NSString *)title {
    return @"Replace placeholder";
}

- (void)main:(MUPath *)path invoker:(id<TLInvoker>)invoker {
    [self.list enumerateObjectsUsingBlock:^(TLReplaceItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self inDirectory:path replace:obj.origin to:obj.target];
    }];
}

- (void)inDirectory:(MUPath *)directory replace:(NSString *)replace to:(NSString *)to {
    [self _inDirectory:directory replace:replace to:to];
}

- (void)_inDirectory:(MUPath *)directory replace:(NSString *)replace to:(NSString *)to {
    [directory enumerateContentsUsingBlock:^(MUPath *content, BOOL *stop) {
        if (content.isFile) {
            [self _inFile:content replace:replace to:to];
            if ([content.lastPathComponent containsString:replace]) {
                NSString *name = content.lastPathComponent;
                name = [name stringByReplacingOccurrencesOfString:replace withString:to];
                MUPath *to = [content pathByReplacingLastPathComponent:name];
                CLVerbose(@"Move %@ to %@", content.lastPathComponent, to.lastPathComponent);
                [content moveTo:to autoCover:YES];
            }
        } else {
            [self _inDirectory:content replace:replace to:to];
            if ([content.lastPathComponent containsString:replace]) {
                NSString *name = content.lastPathComponent;
                name = [name stringByReplacingOccurrencesOfString:replace withString:to];
                MUPath *to = [content pathByReplacingLastPathComponent:name];
                CLVerbose(@"Move %@ to %@", content.lastPathComponent, to.lastPathComponent);
                [content moveTo:to autoCover:YES];
            }
        }
    }];
}

- (void)_inFile:(MUPath *)file replace:(NSString *)replace to:(NSString *)to {
    @autoreleasepool {
        NSString *content = [self read:file];
        content = [content stringByReplacingOccurrencesOfString:replace withString:to];
        [self save:content to:file];
    }
}

- (NSString *)read:(MUPath *)file {
    NSString *string = [NSString stringWithContentsOfFile:file.string encoding:NSUTF8StringEncoding error:nil];
    return string;
}

- (void)save:(NSString *)content to:(MUPath *)file {
    [content writeToFile:file.string atomically:YES encoding:NSUTF8StringEncoding error:nil];
}

@synthesize list = _list;
- (NSMutableArray *)list {
    if (!_list) {
        _list = [NSMutableArray array];
    }
    return _list;
}


@end
