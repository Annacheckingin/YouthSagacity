//
//  LzgCategoryValueHandler.h
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/2.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LzgCategoryValueHandler : NSObject
+(instancetype)shareInstance;
-(id)dictionaryOrArrayWithResonseObjec:(id)resonseObject;
@end

NS_ASSUME_NONNULL_END
