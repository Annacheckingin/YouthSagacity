//
//  LzgWraithServerRequest.m
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/2.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "LzgWraithServerRequest.h"
#import "AFNetworking.h"
#import "LzgRegistModel.h"
#import "LzgLogModel.h"
#import "LzgWraithServerManager.h"

//typedef NS_ENUM(NSInteger,kHasDelegate)
//{
//    have_no_deleagte,
//    have_delegate
//};
@interface LzgWraithServerRequest ()
//@property(nonatomic,strong)NSString *serverUserName;
//@property(nonatomic,assign)kHasDelegate hasDelegate;

@end
@implementation LzgWraithServerRequest

static  LzgWraithServerRequest *me;
-(id)fetchDataAboutTheCategory:(NSString *)category
{
    __block id TheReturnedValue;
    NSString *theCategoryTarget=[[LzgWraithServerManager shareInstance] generateTheCategoryPostApi];
    NSDictionary *dicParameterOfCategory=[[LzgWraithServerManager shareInstance] categoryGenerteDictionaryWithCategoryName:category];
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
        me=[[LzgWraithServerRequest alloc]init];
//        me.hasDelegate=have_no_deleagte;
    }
    return me;
}
-(BOOL)WraithServerRegistWithAcount:(NSString *)acount andPassWord:(NSString *)password
{
    
    return NO;
}
-(BOOL)WraithServerLogWithAcount:(NSString *)acount andPassWord:(NSString *)password;
{
//    BOOL logValue=[self.logModel loggingWithAcount:acount andPassWord:password];
//    return logValue;
    return NO;
}
@end
