//
//  LzgLogModel+hard.h
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/7.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//




#import "LzgLogModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LzgLogModel (hard)
-(void)hardloggingWithAcount:(NSString *)acount andPassWord:(NSString *)password handler:(void(^)(BOOL isucced,NSString *userid,NSString *username))handler;
@end

NS_ASSUME_NONNULL_END
