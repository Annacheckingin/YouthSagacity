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
        @throw [NSException exceptionWithName:@"Method Error" reason:@"Use initWithPortraite: andName: andBody: instead " userInfo:nil];
    }
    return self;
}
-(instancetype)initWithPortraite:(NSString *)po andName:(NSString *)name andBody:(NSString *)bod
{
    if (self=[super init])
    {
        self.urlofPortraite=po;
        self.nameOfUser=name;
        self.mesageBody=bod;
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
-(NSString  *)description
{
  return   [NSString stringWithFormat:@"portraite%@;name->:%@;message->:%@",self.urlofPortraite,self.nameOfUser,self.mesageBody];
}
@end
