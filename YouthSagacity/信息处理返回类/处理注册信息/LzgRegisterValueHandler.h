//
//  LzgRegisterValueHandler.h
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/2.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LzgRegisterValueHandler : NSObject
-(BOOL)registerSuccess:(id)resonseObject;
+(instancetype)shareInstance;
@end

NS_ASSUME_NONNULL_END
