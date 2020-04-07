//
//  UserInfor+CoreDataProperties.h
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/4.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//
//

#import "UserInfor+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface UserInfor (CoreDataProperties)

+ (NSFetchRequest<UserInfor *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *userid;
@property (nonatomic) BOOL isLogSatus;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSDate *timeOfLastQuit;

@end

NS_ASSUME_NONNULL_END
