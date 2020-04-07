//
//  LzgRegistModel.h
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/2.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LzgRegistModel : NSObject
+(instancetype)shareInstance;
-(void)setTheServerName:(NSString *)serVerName;
-(void)registWithAcount:(NSString *)acount andPassword:(NSString *)password handler:(void (^)(BOOL issucced)) Handler;
-(void)registerWithAcount:(NSString *)acount andPassword:(NSString *)password withAdditionalInfor:(NSArray  * _Nullable )inforWithsequence_em_ni_he_mo handler:(void (^)(BOOL issuccessed)) handler;
@end

NS_ASSUME_NONNULL_END
