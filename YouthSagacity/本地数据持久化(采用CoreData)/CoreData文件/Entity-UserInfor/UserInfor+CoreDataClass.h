//
//  UserInfor+CoreDataClass.h
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/4.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserInfor : NSManagedObject
+(UserInfor *)userWithUserid:(NSString *)userid andUserName:(NSString *)userName andPassWord:(NSString *)password andDateOflastQuit:(NSDate *)dateOfLastQuit andLogStatus:(BOOL) status withBlock:(void (^)(UserInfor *userinfor,NSManagedObjectContext *context)) block;
@end

NS_ASSUME_NONNULL_END

#import "UserInfor+CoreDataProperties.h"
