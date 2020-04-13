//
//  LzgMessageModel.h
//  YouthSagacity
//
//  Created by LiZhengGuo on 2020/4/10.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LzgMessageModel : NSObject
@property(nonatomic,strong)NSString *urlofPortraite;
@property(nonatomic,strong)NSString *nameOfUser;
@property(nonatomic,strong)NSString *mesageBody;
-(instancetype)initWithPortraite:(NSString *)po andName:(NSString *)name andBody:(NSString *)bod;
@end

NS_ASSUME_NONNULL_END
