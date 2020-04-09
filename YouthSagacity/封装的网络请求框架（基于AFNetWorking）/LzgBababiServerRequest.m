//
//  LzgBababiServerRequest.m
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/2.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "LzgBababiServerRequest.h"
#import "AFNetworking.h"
#import "LzgRegistModel.h"
#import "LzgLogModel.h"
#import "LzgBabaBiServerManager.h"

//typedef NS_ENUM(NSInteger,kHasDelegate)
//{
//    have_no_deleagte,
//    have_delegate
//};
@interface LzgBababiServerRequest ()
//@property(nonatomic,strong)NSString *serverUserName;
//@property(nonatomic,assign)kHasDelegate hasDelegate;

@end
@implementation LzgBababiServerRequest

static  LzgBababiServerRequest *me;
-(id)fetchDataAboutTheCategory:(NSString *)category
{
    __block id TheReturnedValue;
    NSString *theCategoryTarget=[[LzgBabaBiServerManager shareInstance] generateTheCategoryPostApi];
    NSDictionary *dicParameterOfCategory=[[LzgBabaBiServerManager shareInstance] categoryGenerteDictionaryWithCategoryName:category];
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    [manager POST:theCategoryTarget parameters:dicParameterOfCategory success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
    {
        TheReturnedValue=responseObject;
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
    {
        
    }];
    
    return TheReturnedValue;
}

+(instancetype)shareInstance
{
    if (me==nil)
    {
        me=[[LzgBababiServerRequest alloc]init];
//        me.hasDelegate=have_no_deleagte;
    }
    return me;
}
-(BOOL)bababiServerRegistWithAcount:(NSString *)acount andPassWord:(NSString *)password
{
    
    return NO;
}
-(BOOL)bababiServerLogWithAcount:(NSString *)acount andPassWord:(NSString *)password;
{
//    BOOL logValue=[self.logModel loggingWithAcount:acount andPassWord:password];
//    return logValue;
    return NO;
}
@end
