//
//  LzgLogModel.m
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/1.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "LzgLogModel.h"
#import "AFNetworking.h"
#import "LzgBabaBiServerManager.h"
#import "LzgLogValueHandler.h"
static LzgLogModel *me;
@interface LzgLogModel ()

@property(nonatomic,assign) BOOL islogging;
@end
@implementation LzgLogModel
-(void)chaneLoggingStatus
{
    self.islogging=!self.islogging;
}
-(void)setTheLogStatus:(BOOL)islogging
{
    self.islogging=islogging;
}
+(instancetype)shareInstance
{
    if (!me) {
        me=[[LzgLogModel alloc]init];
    }
    me.islogging=NO;
    return me;
}
-(void)loggingWithAcount:(NSString *)acount andPassWord:(NSString *)password handler:(void(^)(BOOL isucced,NSString *userid,NSString *username))handler
{
    if (([acount isEqualToString:@""]||acount==nil)&([password isEqualToString:@""]||password==nil))
    {
        handler(NO,nil,nil);
    }
    __block BOOL returnedValue=NO;
    AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
    NSString *theLogActionApiTarget=[[LzgBabaBiServerManager shareInstance] logApiString];
    NSDictionary *dicParameterOfLog=[[LzgBabaBiServerManager shareInstance] logGenerateParameterDictionaryWithAcount:acount andPassword:password];
    [manager POST:theLogActionApiTarget parameters:dicParameterOfLog success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
    {
        returnedValue=[[LzgLogValueHandler shareInstance] logSuccess:responseObject];
        NSString *userid=responseObject[@"data"][@"_id"];
        NSString *userNameKey=[[LzgBabaBiServerManager shareInstance] l_userName];
        NSString *username=responseObject[@"data"][userNameKey];
        handler(returnedValue,userid,username);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
     
}

@end
