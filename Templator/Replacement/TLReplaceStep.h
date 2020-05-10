//
//  TLReplaceStep.h
//  Templator
//
//  Created by 吴双 on 2020/3/4.
//

#import "TLStep.h"

@interface TLReplaceItem : NSObject

@property (nonatomic, copy) NSString *origin;

@property (nonatomic, copy) NSString *target;

@end

@interface TLReplaceStep : TLStep

- (void)replace:(NSString *)origin to:(NSString *)target;

@end
