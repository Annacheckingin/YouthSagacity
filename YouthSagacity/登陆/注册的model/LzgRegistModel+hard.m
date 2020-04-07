//
//  LzgRegistModel+hard.m
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/7.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "LzgRegistModel+hard.h"
#import "LzgSimpleNSFamilyDataStore.h"



@implementation LzgRegistModel (hard)
-(void)hardregistWithAcount:(NSString *)acount andPassword:(NSString *)password handler:(void (^)(BOOL))Handler
{
    dispatch_queue_t mainQueue_t=dispatch_get_main_queue();
    dispatch_queue_t backgroundQueue_t=dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    dispatch_async(backgroundQueue_t, ^
    {
        LzgSimpleNSFamilyDataStore *storeCenter=[LzgSimpleNSFamilyDataStore shareInstance];
        BOOL issuccess= [storeCenter saveTheDataOfUser:[NSDate date].description andTheName:acount andTheQuitTime:[NSDate date] logStatus:NO];
        dispatch_async(mainQueue_t, ^
        {
            Handler(issuccess);
        });
    });
    
}
@end
