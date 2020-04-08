//
//  LzgAcount_PasswordValidate.m
//  YouthSagacity
//
//  Created by LiZhengGuo on 2020/4/8.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "LzgAcount_PasswordValidate.h"

@implementation LzgAcount_PasswordValidate
+(instancetype)shareInstance
{
    static LzgAcount_PasswordValidate *me;
    if (me==nil)
    {
        me=[[LzgAcount_PasswordValidate alloc]init];
    }
    return me;
}
-(instancetype)init
{
    if (self=[super init])
    {
        
    }
    return self;
}
-(BOOL)isValidateWithAcount:(NSString *)acount passWord:(NSString *)passWord
{
    if (!acount||!passWord)
    {
        return NO;
    }
    if ([acount isEqualToString:@""]||[passWord isEqualToString:@""])
    {
        return NO;
    }
    return YES;
}
@end
