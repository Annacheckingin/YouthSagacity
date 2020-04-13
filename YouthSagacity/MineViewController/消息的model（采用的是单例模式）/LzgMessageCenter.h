//
//  LzgMessageCenter.h
//  YouthSagacity
//
//  Created by LiZhengGuo on 2020/4/10.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LzgMessageModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface LzgMessageCenter : NSObject
+(instancetype)shareInstance;
-(void)saveMessage:(LzgMessageModel *)aMessage;
-(void)deleteALike:(LzgMessageModel *)aMS;
-(void)deleteAMSAtIndex:(NSInteger)index;
-(NSInteger)numOfMesages;
-(NSMutableArray <LzgMessageModel *>*)messages;
@end

NS_ASSUME_NONNULL_END
