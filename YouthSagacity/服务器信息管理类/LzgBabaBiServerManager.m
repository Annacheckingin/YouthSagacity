//
//  LzgBabaBiServerManager.m
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/2.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "LzgBabaBiServerManager.h"
#define LzgRegisterString @"register"
#define LzgLogString @"login"
#define LzgCategoryString @"catlist"
#define LzgUserNamePlaceHolder @"username"
#define LzgPwdPlaceHolder @"pwd"
#define LzgEmailPlaceHolder @"email"
#define LzgNickNamePlaceHolder @"nickname"
#define LzgMobilePlaceHoder @"mobile"
#define LzgHeadPlaceHolder @"head"
#import <objc/runtime.h>
@implementation LzgBabaBiServerManager
static LzgBabaBiServerManager *LzgBabaBiServerManagerme;
#warning change
static const char *kurlPrefixString="";
static const char *kurlTailString="/api/";
#warning change
static const char* LzgBabaBiServerManagerClassKey="LzgServerManagerClassKey";
+(void)setTheServerName:(NSString *)name
{
    objc_setAssociatedObject(self, LzgBabaBiServerManagerClassKey, name, OBJC_ASSOCIATION_RETAIN);
}
-(NSDictionary *)logGenerateParameterDictionaryWithAcount:(NSString *)acount andPassword:(NSString *)password
{
    return @{
        [[NSString stringWithFormat:@"%@%@",[LzgBabaBiServerManager theServerName],[LzgBabaBiServerManager shareInstance].fixedPlaceholderString] stringByAppendingString:LzgUserNamePlaceHolder]:acount,
        [[NSString stringWithFormat:@"%@%@",[LzgBabaBiServerManager theServerName],[LzgBabaBiServerManager shareInstance].fixedPlaceholderString] stringByAppendingString:LzgPwdPlaceHolder]:password
    };
}
+(NSString *)theServerName
{
    id objc=objc_getAssociatedObject(self, LzgBabaBiServerManagerClassKey);
    if (objc==nil)
    {
        @throw [NSException exceptionWithName:@"Error" reason:@"serverName didnt initialized" userInfo:nil];
    }
  return   objc_getAssociatedObject(self, LzgBabaBiServerManagerClassKey);
}
-(NSString *)theServerName
{
    if ([LzgBabaBiServerManager theServerName]==nil)
    {
        if (_theServerName)
        {
             return _theServerName;
        }
        else
        {
            @throw [NSException exceptionWithName:@"Null Exception!" reason:@"'theSerVerName' expected property is nil" userInfo:nil];
        }
    }
    return [LzgBabaBiServerManager theServerName];
}

-(NSString *)generateTheCategoryPostApi;
{
    return [NSString stringWithFormat:@"%s%@%s%@",kurlPrefixString,self.theServerName,kurlTailString,LzgCategoryString];
}
-(NSString *)logApiString
{
    return [NSString stringWithFormat:@"%s%@%s%@",kurlPrefixString,self.theServerName,kurlTailString,LzgLogString];
}
-(NSString *)registerApiString
{
    return [[NSString stringWithFormat:@"%s%@%s",kurlPrefixString,self.theServerName,kurlTailString] stringByAppendingString:LzgRegisterString];
}
-(NSDictionary *)registerGenerateParameterDictionaryWithAcount:(NSString *)acount andPassword:(NSString *)password withAdditionalInfor:(NSArray *)inforWithsequence_em_ni_he_mo
{
    if (inforWithsequence_em_ni_he_mo)
    {
        NSString *emailString=inforWithsequence_em_ni_he_mo[0];
        NSString *nickNameString=inforWithsequence_em_ni_he_mo[1];
        NSString *headString=inforWithsequence_em_ni_he_mo[2];
        NSString *mobilString=inforWithsequence_em_ni_he_mo[3];
        NSDictionary *dic=@{
            [[NSString stringWithFormat:@"%@%@",self.theServerName,self.fixedPlaceholderString]stringByAppendingString:LzgUserNamePlaceHolder]:acount,
            [[NSString stringWithFormat:@"%@%@",self.theServerName,self.fixedPlaceholderString]stringByAppendingString:LzgPwdPlaceHolder]:password,
            [[NSString stringWithFormat:@"%@%@",self.theServerName,self.fixedPlaceholderString]stringByAppendingString:LzgEmailPlaceHolder]:emailString,
            [[NSString stringWithFormat:@"%@%@",self.theServerName,self.fixedPlaceholderString]stringByAppendingString:LzgNickNamePlaceHolder]:nickNameString,
            [[NSString stringWithFormat:@"%@%@",self.theServerName,self.fixedPlaceholderString]stringByAppendingString:LzgMobilePlaceHoder]:mobilString,
            [[NSString stringWithFormat:@"%@%@",self.theServerName,self.fixedPlaceholderString]stringByAppendingString:LzgHeadPlaceHolder]:headString
        };
        return dic;
    }
    NSDictionary *dic=@{
    [[NSString stringWithFormat:@"%@%@",self.theServerName,self.fixedPlaceholderString]stringByAppendingString:LzgUserNamePlaceHolder]:acount,
    [[NSString stringWithFormat:@"%@%@",self.theServerName,self.fixedPlaceholderString]stringByAppendingString:LzgPwdPlaceHolder]:password,
    [[NSString stringWithFormat:@"%@%@",self.theServerName,self.fixedPlaceholderString]stringByAppendingString:LzgEmailPlaceHolder]:@"",
    [[NSString stringWithFormat:@"%@%@",self.theServerName,self.fixedPlaceholderString]stringByAppendingString:LzgNickNamePlaceHolder]:@""
    };
    return dic;
    
}
+(instancetype)shareInstance
{
    if (LzgBabaBiServerManagerme==nil)
    {
        LzgBabaBiServerManagerme=[[LzgBabaBiServerManager alloc]init];
    }
    return LzgBabaBiServerManagerme;
}
//-(BOOL)kregistAction
//{
//    return NO;
//}

-(NSString *)fixedPlaceholderString
{
    if (_fixedPlaceholderString==nil)
    {
       return  @"_yh_";
    }
    return _fixedPlaceholderString;
}
-(NSString *)fixedPlaceHolerStringForCategory
{
    if (_fixedPlaceHolerStringForCategory==nil)
    {
        return @"_sp_";
    }
    return _fixedPlaceHolerStringForCategory;
}
-(NSString *)r_email
{
   
    if (_r_email==nil)
    {
        return [NSString stringWithFormat:@"%@%@%@",[LzgBabaBiServerManager theServerName],[LzgBabaBiServerManager shareInstance].fixedPlaceholderString,@"email"];
    }
    return _r_email;
}
-(NSString *)l_userName
{
 return [self r_userName];
}
-(NSString *)r_userName
{
  
    if (_r_userName==nil)
    {
        return [NSString stringWithFormat:@"%@%@%@",[LzgBabaBiServerManager theServerName],[LzgBabaBiServerManager shareInstance].fixedPlaceholderString,@"username"];
    }
    return _r_nickName;
}
-(NSString *)r_nickName
{
  
    if (_r_nickName==nil)
    {
        
        return [NSString stringWithFormat:@"%@%@%@",[LzgBabaBiServerManager theServerName],[LzgBabaBiServerManager shareInstance].fixedPlaceholderString,@"nickname"];
    }
    return _r_nickName;
}
-(NSString *)r_head
{
    if (_r_head==nil)
    {
        return [NSString stringWithFormat:@"%@%@%@",[LzgBabaBiServerManager theServerName],[LzgBabaBiServerManager shareInstance].fixedPlaceholderString,@"head"];
    }
    return _r_head;
}
-(NSString *)l_email
{
    return [self r_email];
}
-(NSString *)l_mobil
{
    return [self r_email];
}
-(NSString *)l_nickName
{
    return [self r_nickName];
}

-(NSDictionary *)categoryGenerteDictionaryWithCategoryName:(NSString *)category
{
    return @{
        [NSString stringWithFormat:@"%@"]:category
    };
}
@end
