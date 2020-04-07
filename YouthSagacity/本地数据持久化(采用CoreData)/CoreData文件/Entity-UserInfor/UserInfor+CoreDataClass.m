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
@implementation UserInfor
+(UserInfor *)userWithUserid:(NSString *)userid andUserName:(NSString *)userName andDateOflastQuit:(NSDate *)dateOfLastQuit andLogStatus:(BOOL)status
{
    UserInfor *me=(UserInfor *)[NSEntityDescription entityForName:NSStringFromClass([UserInfor class]) inManagedObjectContext:[[LzgSimpleNSFamilyDataStore shareInstance] contextWithIdentifier:NSStringFromClass([UserInfor class])]];
    NSLog(@"%@",NSStringFromClass([UserInfor class]));
//    me.userid=userid;
//    me.name=userName;
//    me.isLogSatus=status;
//    me.timeOfLastQuit=dateOfLastQuit;
    NSNumber *statusNum=[NSNumber numberWithBool:status];
    [me setValue:userid forKey:@"userid"];
    [me setValue:userName forKey:@"name"];
    [me setValue:statusNum forKey:@"isLogSatus"];
   [me setValue:dateOfLastQuit forKey:@"timeOfLastQuit"];
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
