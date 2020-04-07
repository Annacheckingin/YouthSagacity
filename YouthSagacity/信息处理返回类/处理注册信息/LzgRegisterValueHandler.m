//
//  LzgRegisterValueHandler.m
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/2.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "LzgRegisterValueHandler.h"

@implementation LzgRegisterValueHandler
static  LzgRegisterValueHandler *me;
+(instancetype)shareInstance
{
    if (me==nil)
    {
        me=[[LzgRegisterValueHandler alloc]init];
    }
    return me;
}
-(BOOL)registerSuccess:(id)resonseObject
{
    if (resonseObject==nil)
    {
        @throw [NSException exceptionWithName:@"parameter is nil" reason:@"resonseObject cant be nil" userInfo:nil];
    }
    NSDictionary *dic=(NSDictionary *)resonseObject;
    NSNumber *theCodeFieldValue=dic[@"code"];
    if (![theCodeFieldValue isEqualToNumber:@0])
    {
        NSString *errorString=@"something happende ,reason:";
        switch (theCodeFieldValue.integerValue)
        {
                case 110101:
                NSLog(@"%@UserName cant be empty!",errorString);
                break;
                case 110102:
                  NSLog(@"%@Email can't be empty!",errorString);
                break;
                case 110103:
                  NSLog(@"%@Password can't be empty!",errorString);
                break;
                case 110409:
                  NSLog(@"%@User exsits already!",errorString);
                break;
                case 110500:
                  NSLog(@"%@Register failed!",errorString);
                break;
                case 100000:
                  NSLog(@"%@Register api was wrong!",errorString);
                break;
                case 100001:
                  NSLog(@"%@Ukown error happened!",errorString);
                break;
        }
      
        return NO;
    }
    
    return YES;
}
@end
