//
//  LzgLikesModel.h
//  YouthSagacity
//
//  Created by LiZhengGuo on 2020/4/10.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LikesModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface LzgLikesModel : NSObject
+(instancetype)shareInstance;
-(void)saveAlike:(LikesModel * _Nonnull )alike;
@end

NS_ASSUME_NONNULL_END
