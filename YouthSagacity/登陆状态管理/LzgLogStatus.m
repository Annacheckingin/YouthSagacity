//
//  LzgLogStatus.m
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/2.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "LzgLogStatus.h"
#import "LzgSimpleNSFamilyDataStore.h"
@interface LzgLogStatus ()
@property(nonatomic,assign) BOOL islogging;
@property(nonatomic,strong)LzgSimpleNSFamilyDataStore *storeCenter;
@end
@implementation LzgLogStatus
static LzgLogStatus *me;
+(instancetype)shareInstance
{
    if (me==nil)
    {
        me=[[LzgLogStatus alloc]init];
        
    }
    return me;
}
-(LzgSimpleNSFamilyDataStore *)storeCenter
{
    if (_storeCenter==nil)
    {
        _storeCenter=[LzgSimpleNSFamilyDataStore shareInstance];
    }
    return _storeCenter;
}
-(void)setLoggingStatus:(BOOL)status WithId:(NSString *)userid anduserName:(NSString *)userName;
{
    self.islogging=status;
    [self.storeCenter saveTheDataOfUser:userid andTheName:userName andTheQuitTime:[NSDate date] logStatus:status];
}
@end
