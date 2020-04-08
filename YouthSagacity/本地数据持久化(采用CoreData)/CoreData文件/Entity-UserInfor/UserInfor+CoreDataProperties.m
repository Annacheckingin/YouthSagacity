//
//  UserInfor+CoreDataProperties.m
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/4.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//
//

#import "UserInfor+CoreDataProperties.h"
//@interface UserInfor ()
//{
//    NSString *_usrid;
//    BOOL _isLogSatus;
//    NSString *_name;
//    NSDate *_timeOfLastQuit;
//}
//
//@end
@implementation UserInfor (CoreDataProperties)

+ (NSFetchRequest<UserInfor *> *)fetchRequest
{
	return [NSFetchRequest fetchRequestWithEntityName:@"UserInfor"];
}
-(BOOL)userIsEqual:(id)object
{
 
    
    if (![object isMemberOfClass:[UserInfor class]])
    {
        return NO;
    }
    UserInfor *userInfor=(UserInfor *)object;

    if (![self.name isEqualToString:userInfor.name])
    {
        return NO;
    }

    return YES;
}
@dynamic userid;
@dynamic isLogSatus;
@dynamic name;
@dynamic timeOfLastQuit;
@dynamic password;

//-(void)setUserid:(NSString *)userid
//{
//    _usrid=userid;
//}
//-(void)setName:(NSString *)name
//{
//    _name=name;
//}
//-(void)setIsLogSatus:(BOOL)isLogSatus
//{
//    _isLogSatus=isLogSatus;
//}
//-(void)setTimeOfLastQuit:(NSDate *)timeOfLastQuit
//{
//    _timeOfLastQuit=timeOfLastQuit;
//}
//-(NSString *)userid
//{
//    return _usrid;
//}
//-(BOOL)isLogSatus
//{
//    return _isLogSatus;
//}
//-(NSString *)name
//{
//    return _name;
//}
//-(NSDate *)timeOfLastQuit
//{
//    return _timeOfLastQuit;
//}
@end
