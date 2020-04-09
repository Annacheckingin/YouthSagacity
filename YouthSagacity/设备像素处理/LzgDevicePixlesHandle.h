//
//  LzgDevicePixlesHandle.h
//  YouthSagacity
//
//  Created by LiZhengGuo on 2020/4/9.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
FOUNDATION_EXTERN  const NSString * LzgDevicePixlesHandleIphone8;
FOUNDATION_EXTERN const NSString *LzgDevicePixlesHandleIphone8plus;
FOUNDATION_EXTERN const NSString *LzgDevicePixlesHandleIphone11;
FOUNDATION_EXTERN const NSString *LzgDevicePixlesHandleIphone11Pro;
FOUNDATION_EXTERN const NSString *LzgDevicePixlesHandleIphone11ProMax;
@interface LzgDevicePixlesHandle : NSObject
-(NSString *)deviceName;
-(CGFloat)widthWithDevice:(NSString *)deviceName;
-(CGFloat)heightWithDeviceName:(NSString *)deviceName;
+(instancetype)shareInstance;
@end

NS_ASSUME_NONNULL_END
