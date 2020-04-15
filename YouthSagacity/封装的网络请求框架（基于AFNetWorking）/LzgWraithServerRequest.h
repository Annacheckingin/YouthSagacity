//
//  LzgWraithServerRequest.h
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/2.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LzgWraithServerRequest : NSObject
//@property(nonatomic,weak) id delegate;
+(instancetype)shareInstance;
-(BOOL)WraithServerRegistWithAcount:(NSString *)acount andPassWord:(NSString *)password;
-(BOOL)WraithServerLogWithAcount:(NSString *)acount andPassWord:(NSString *)password;
-(id)fetchDataAboutTheCategory:(NSString *)category;
@end

NS_ASSUME_NONNULL_END
