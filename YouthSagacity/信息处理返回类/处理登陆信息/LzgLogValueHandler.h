//
//  LzgLogValueHandle.h
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/2.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LzgLogValueHandler : NSObject
+(instancetype)shareInstance;
-(BOOL)logSuccess:(id)resonseObjec;
@end

NS_ASSUME_NONNULL_END
