//
//  UserInfor+CoreDataClass.m
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/4.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//
//

#import "UserInfor+CoreDataClass.h"
#import "LzgSimpleNSFamilyDataStore.h"
#import "UserInfor+CoreDataClass.h"
@implementation UserInfor
+(UserInfor *)userWithUserid:(NSString *)userid andUserName:(NSString *)userName andPassWord:(NSString *)password andDateOflastQuit:(NSDate *)dateOfLastQuit andLogStatus:(BOOL) status withBlock:(void (^)(UserInfor *userinfor,NSManagedObjectContext *context)) block;
{

    UserInfor *me=(UserInfor *)[NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([UserInfor class]) inManagedObjectContext:[[LzgSimpleNSFamilyDataStore shareInstance] contextWithIdentifier:NSStringFromClass([UserInfor class])]];
    NSNumber *statusNum=[NSNumber numberWithBool:status];
      me.userid=userid;
      me.name=userName;
      me.isLogSatus=statusNum;
      me.timeOfLastQuit=dateOfLastQuit;
     me.password=password;
    return me;
}
-(instancetype)init
{
    if (self=[super init])
    {
        
    }
    return self;
}
@end
