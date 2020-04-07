//
//  LzgLogStatus.h
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/2.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LzgLogStatus : NSObject
+(instancetype)shareInstance;
-(void)setLoggingStatus:(BOOL)status WithId:(NSString *)userid anduserName:(NSString *)userName;
@property(nonatomic,readonly) BOOL islogging;
@end

NS_ASSUME_NONNULL_END
