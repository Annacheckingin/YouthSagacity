//
//  LzgMessageModel.m
//  YouthSagacity
//
//  Created by LiZhengGuo on 2020/4/10.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "LzgMessageModel.h"

@implementation LzgMessageModel
-(instancetype)init
{
    if (self=[super init])
    {
        
    }
    return self;
}
-(BOOL)isEqual:(id)object
{
    if ([self class]!=[object class])
    {
        return NO;
    }
    LzgMessageModel *mode=(LzgMessageModel *)object;
    if (![self.urlofPortraite isEqualToString:mode.urlofPortraite])
    {
        return NO;
    }
    if (![self.nameOfUser isEqualToString:self.nameOfUser]) {
        return NO;
    }
    return YES;
}
@end
