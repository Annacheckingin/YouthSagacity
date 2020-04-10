//
//  LzgSandBoxStore.h
//  YouthSagacity
//
//  Created by LiZhengGuo on 2020/4/8.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LzgSandBoxStore : NSObject
+(instancetype)shareInstance;
-(NSString *)stringForSandBoxOfDocument;
-(BOOL)fileExistInDocumentDirectoryWithName:(NSString *)fileName;

@end

NS_ASSUME_NONNULL_END
