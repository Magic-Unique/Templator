//
//  TLCreator.h
//  Templator
//
//  Created by 吴双 on 2020/3/4.
//

#import <Foundation/Foundation.h>
#import <MUFoundation/MUPath.h>
#import <CommandLine/CommandLine.h>
#import "TLStep.h"

@interface TLCreator : NSObject

@property (nonatomic, strong, readonly) NSArray<TLStep *> *steps;

- (void)addStep:(TLStep *)step;

- (void)create:(MUPath *)path;

@end
