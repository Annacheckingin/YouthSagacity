//
//  LzgRegistModel+hard.h
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/7.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//




#import "LzgRegistModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LzgRegistModel (hard)
-(void)hardregistWithAcount:(NSString *)acount andPassword:(NSString *)password handler:(void (^)(BOOL issucced)) Handler;
@end

NS_ASSUME_NONNULL_END
