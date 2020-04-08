//
//  LzgAcount_PasswordValidate.h
//  YouthSagacity
//
//  Created by LiZhengGuo on 2020/4/8.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LzgAcount_PasswordValidate : NSObject
+(instancetype)shareInstance;
-(BOOL)isValidateWithAcount:( NSString * _Nullable )acount passWord:( NSString * _Nullable )passWord;
@end

NS_ASSUME_NONNULL_END
