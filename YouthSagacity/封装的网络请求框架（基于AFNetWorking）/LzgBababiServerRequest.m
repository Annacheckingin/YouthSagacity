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
//-(LzgLogModel *)logModel
//{
//    if (_logModel==nil)
//    {
//        _logModel=[LzgLogModel shareInstance];
//    }
//    return _logModel;
//}
//-(LzgRegistModel *)registModel
//{
//    if (_registModel==nil)
//    {
//        _registModel=[LzgRegistModel shareInstance];
//    }
//    return _registModel;
//}
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
    
//    BOOL registValue=[self.registModel registWithAcount:acount andPassword:password];
//        AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
//        NSString *thePostActionTarget=[[[[[NSMutableString alloc]initWithUTF8String:kurlPrefixString] stringByAppendingString:_serverUserName] stringByAppendingString:[NSString stringWithUTF8String:kurlTailString]]stringByAppendingString:LzgRegisterString];
//
//        return registValue;
    return NO;
}
-(BOOL)bababiServerLogWithAcount:(NSString *)acount andPassWord:(NSString *)password;
{
//    BOOL logValue=[self.logModel loggingWithAcount:acount andPassWord:password];
//    return logValue;
    return NO;
}
@end
