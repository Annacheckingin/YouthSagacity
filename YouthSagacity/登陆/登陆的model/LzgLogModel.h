//
//  LzgLogModel.h
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/1.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LzgLogModel : NSObject
+(instancetype)shareInstance;
@property(nonatomic,readonly)BOOL islogging;
-(void)setTheLogStatus:(BOOL)islogging;
-(void)chaneLoggingStatus;
-(void)loggingWithAcount:(NSString *)acount andPassWord:(NSString *)password handler:(void(^)(BOOL isucced,NSString *userid,NSString *username))handler;
@end

NS_ASSUME_NONNULL_END
