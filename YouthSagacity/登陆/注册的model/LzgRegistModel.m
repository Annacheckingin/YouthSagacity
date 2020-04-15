//
//  LzgRegistModel.m
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/2.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "LzgRegistModel.h"
#import <objc/runtime.h>
#import "LzgWraithServerManager.h"
#import "AFNetworking.h"
#import "LzgRegisterValueHandler.h"
////
#pragma mark 内部类
typedef NS_OPTIONS(NSInteger, LzgRegistInforCondition)
{
    hasEmail=1<<0,
    hasNickName=1<<1,
    hasHead=1<<2,
    hasMobile=1<<3
};
@interface LzgRegistModel ()
@property(nonatomic,strong)LzgWraithServerManager *serverManager;
@end

@implementation LzgRegistModel

static LzgRegistModel *RegisterModelme;
-(instancetype)init
{
    if (self=[super init])
    {
        _serverManager=[LzgWraithServerManager shareInstance];
    }
    return self;
}

-(void)setTheServerName:(NSString *)serVerName
{
    _serverManager.theServerName=serVerName;
}
+(instancetype)shareInstance
{
    if (!RegisterModelme)
    {
        RegisterModelme=[[LzgRegistModel alloc]init];
    }
    return RegisterModelme;
}
-(void)registWithAcount:(NSString *)acount andPassword:(NSString *)password handler:(void (^)(BOOL issucced)) Handler
{
    if(([acount isEqualToString:@""]||acount==nil)&&([password isEqualToString:@""]||password==nil))
    {
        Handler(NO);
    }
    [self registerWithAcount:acount andPassword:password withAdditionalInfor:nil handler:^(BOOL issuccessed)
    {
        Handler(issuccessed);
    }];
}
-(void)registerWithAcount:(NSString *)acount andPassword:(NSString *)password withAdditionalInfor:(NSArray  * _Nullable )inforWithsequence_em_ni_he_mo handler:(void (^)(BOOL issuccessed)) handler
{
    if (inforWithsequence_em_ni_he_mo==nil)
    {
        AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
        [LzgWraithServerManager setTheServerName:@"tusermen"];
        NSString *thePostTarget=[[LzgWraithServerManager shareInstance] registerApiString];
        NSDictionary *registerDic=[[LzgWraithServerManager shareInstance] registerGenerateParameterDictionaryWithAcount:acount andPassword:password withAdditionalInfor:nil];
        [manager POST:thePostTarget parameters:registerDic success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
         {
            LzgRegisterValueHandler *handerler=[LzgRegisterValueHandler shareInstance];
            BOOL theregisterValue=[handerler registerSuccess:responseObject];
            handler(theregisterValue);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
        {
            NSLog(@"%@",error);
        }];
       
    }
   
}

@end
