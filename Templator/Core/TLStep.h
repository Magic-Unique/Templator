//
//  TLStep.h
//  Templator
//
//  Created by 吴双 on 2020/3/4.
//

#import <Foundation/Foundation.h>
#import <MUFoundation/MUPath.h>
#import <CommandLine/CommandLine.h>
#import "TLInvoker.h"

@interface TLStep : NSObject

@property (nonatomic, copy) NSString *title;

- (void)main:(MUPath *)path invoker:(id<TLInvoker>)invoker;

+ (instancetype)step:(NSString *)title block:(void (^)(MUPath *path, id<TLInvoker> invoker))block;

@end
