//
//  TLOpenStep.h
//  Templator
//
//  Created by 吴双 on 2020/3/4.
//

#import "TLStep.h"

@interface TLOpenStep : TLStep

@property (nonatomic, copy) MUPath *(^findFile)(MUPath *path);

@property (nonatomic, copy) NSString *application;

@end
