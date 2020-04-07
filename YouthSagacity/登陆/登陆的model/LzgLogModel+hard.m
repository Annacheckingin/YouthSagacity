//
//  LzgLogModel+hard.m
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/7.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "LzgLogModel+hard.h"
#import "LzgSimpleNSFamilyDataStore.h"
#import "UserInfor+CoreDataProperties.h"


@implementation LzgLogModel (hard)
-(void)hardloggingWithAcount:(NSString *)acount andPassWord:(NSString *)password handler:(void (^)(BOOL, NSString * _Nonnull, NSString * _Nonnull))handler
{
    dispatch_queue_t mainQueue_t=dispatch_get_main_queue();
    dispatch_queue_t backgroundQueue_t=dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    //////////
    dispatch_async(backgroundQueue_t, ^
    {
        LzgSimpleNSFamilyDataStore *storeCenter=[LzgSimpleNSFamilyDataStore shareInstance];
        
       UserInfor *userInfor=[storeCenter userWithName:acount];
        if (userInfor==nil)
        {
            dispatch_async(mainQueue_t, ^
            {
                handler(NO,@"",@"");
            });
        }
        else
        {
            dispatch_async(mainQueue_t, ^
            {
                handler(YES,userInfor.userid,userInfor.name);
            });
           
        }
        
    });
}
@end
