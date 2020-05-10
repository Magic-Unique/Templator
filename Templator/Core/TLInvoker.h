//
//  TLInvoker.h
//  Templator
//
//  Created by 吴双 on 2020/3/4.
//

#import <Foundation/Foundation.h>

@protocol TLInvoker <NSObject>

@property (nonatomic, strong, readonly) NSMutableDictionary *input;

@property (nonatomic, strong, readonly) NSMutableDictionary *output;

@property (nonatomic, strong, readonly) NSMutableDictionary *env;

@property (nonatomic, assign, readonly) BOOL isSuccess;

- (void)failure;
- (void)success;

@end

@interface TLInvoker : NSObject <TLInvoker>

@property (nonatomic, strong, readonly) NSMutableDictionary *input;

@property (nonatomic, strong, readonly) NSMutableDictionary *output;

@property (nonatomic, strong, readonly) NSMutableDictionary *env;

@property (nonatomic, assign, readonly) BOOL isSuccess;

+ (instancetype)invoker:(NSMutableDictionary *)env
                  input:(NSMutableDictionary *)input
                 output:(NSMutableDictionary *)output;

@end
