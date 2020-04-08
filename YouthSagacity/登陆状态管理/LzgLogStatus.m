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
@property(nonatomic,assign)BOOL freshedData;
-(BOOL)kaccessTheData;
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
-(instancetype)init
{
    if (self=[super init])
    {
        _islogging=NO;
        _freshedData=NO;
    }
    return self;
}
-(LzgSimpleNSFamilyDataStore *)storeCenter
{
    if (_storeCenter==nil)
    {
        _storeCenter=[LzgSimpleNSFamilyDataStore shareInstance];
    }
    return _storeCenter;
}
-(BOOL)kaccessTheData
{
    _freshedData=YES;
    return  [self.storeCenter hasLogUser];
}
-(BOOL)hasLogged
{
    
    if (_freshedData==NO)
    {
        _islogging=YES;
        return  [self kaccessTheData];
    }
    return _islogging;
}

-(void)setLoggingStatus:(BOOL)status WithId:(NSString *)userid anduserName:(NSString *)userName andPassword:(nonnull NSString *)password;
{
    self.islogging=status;
    [self.storeCenter saveTheDataOfUser:userid andTheName:userName andPassword:password  andTheQuitTime:[NSDate date] logStatus:status];
     _freshedData=NO;
}
@end
