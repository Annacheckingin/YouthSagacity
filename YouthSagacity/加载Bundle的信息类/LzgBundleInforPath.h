//
//  LzgBundleInforPath.h
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/3.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LzgBundleInforPath : NSObject
+(instancetype)shareInstance;
-(NSString *)pathOfImage:(NSString *)name ;
-(NSString *)pathOfFile:(NSString *)fileName;
@end

NS_ASSUME_NONNULL_END
