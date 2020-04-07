//
//  LzgBabaBiServerManager.h
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/2.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LzgBabaBiServerManager : NSObject
+(instancetype)shareInstance;
@property(nonatomic,strong)NSString *theServerName;

//固定占位信息
@property(nonatomic,strong)NSString *fixedPlaceholderString;
@property(nonatomic,strong)NSString *fixedPlaceHolerStringForCategory;
//注册的信息
@property(nonatomic,strong)NSString *r_userName;
@property(nonatomic,strong)NSString *r_password;
@property(nonatomic,strong)NSString *r_nickName;
@property(nonatomic,strong)NSString *r_mobile;
@property(nonatomic,strong)NSString *r_head;
@property(nonatomic,strong)NSString *r_email;
//登陆的信息
@property(nonatomic,strong)NSString *l_userName;
@property(nonatomic,strong)NSString *l_email;
@property(nonatomic,strong)NSString *l_mobil;
@property(nonatomic,strong)NSString *l_password;
@property(nonatomic,strong)NSString *l_nickName;
//
+(void)setTheServerName:(NSString *)name;
+(NSString *)theServerName;
-(NSDictionary *)registerGenerateParameterDictionaryWithAcount:(NSString *)acount andPassword:(NSString *)password withAdditionalInfor:( NSArray  * _Nullable )inforWithsequence_em_ni_he_mo;
-(NSDictionary *)logGenerateParameterDictionaryWithAcount:(NSString *)acount andPassword:(NSString *)password;
-(NSString *)registerApiString;
-(NSString *)logApiString;
-(NSString *)generateTheCategoryPostApi;
-(NSDictionary *)categoryGenerteDictionaryWithCategoryName:(NSString *)category;

@end
NS_ASSUME_NONNULL_END
