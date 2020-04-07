//
//  LzgSimpleNSFamilyDataStore.m
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/3.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "LzgSimpleNSFamilyDataStore.h"
#import <CoreData/CoreData.h>
#import "UserInfor+CoreDataClass.h"
#import "Pictures+CoreDataClass.h"
@interface LzgSimpleNSFamilyDataStore ()
@property(nonatomic,strong)NSPersistentContainer *container;
@property(nonatomic,strong)NSManagedObjectContext *contextForUser;
@property(nonatomic,strong)NSManagedObjectContext *contextForPics;
@property(nonatomic,strong)NSPersistentStoreCoordinator *coordinatorForUser;
@property(nonatomic,strong)NSPersistentStoreCoordinator *coordinatorForPics;
@property(nonatomic,strong)NSManagedObjectModel *modelForUserInfor;
@property(nonatomic,strong)NSManagedObjectModel *modelForPictures;
-(void)ksaveCOntext:(NSError **)error withIdentifier:(NSString *)identifer;
@end
@implementation LzgSimpleNSFamilyDataStore
-(NSPersistentStoreCoordinator *)coordinatorForPics
{
    if (_coordinatorForPics==nil)
    {
        _coordinatorForPics=[[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:self.modelForPictures];
    }
    return _coordinatorForPics;
}
-(NSPersistentStoreCoordinator *)coordinatorForUser
{
    if (_coordinatorForUser==nil)
    {
        _coordinatorForUser=[[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:self.modelForUserInfor];
    }
    return _coordinatorForUser;
}
-(NSManagedObjectContext *)contextForPics
{
    if (_contextForPics==nil)
    {
        _contextForPics=[[NSManagedObjectContext alloc]init];
        [_contextForPics setPersistentStoreCoordinator:self.coordinatorForPics];
    }
    return _contextForPics;
}
-(NSManagedObjectContext *)contextForUser
{
    if (_contextForUser==nil)
    {
        _contextForUser=[[NSManagedObjectContext alloc]init];
        [_contextForUser setPersistentStoreCoordinator:self.coordinatorForUser];
    }
    return _contextForUser;
}
-(void)ksaveCOntext:(NSError **)error withIdentifier:(NSString *)identifer
{
    if ([identifer isEqualToString:NSStringFromClass([UserInfor class])])
    {
        if ([self.contextForUser hasChanges]&&![self.contextForUser save:error])
           {
               NSLog(@"%@",*error);
           }
    }
    if ([identifer isEqualToString:NSStringFromClass([Pictures class])])
    {
        if ([self.contextForPics hasChanges]&&![self.contextForPics save:error])
        {
            NSLog(@"%@",*error);
        }
    }
    
}
-(instancetype)init
{
    if (self=[super init])
    {
        
    }
    return self;
}
-(NSManagedObjectContext *)contextWithIdentifier:(NSString *)identifer
{
    if ([identifer isEqualToString:NSStringFromClass([UserInfor class])])
    {
        if (_contextForUser==nil)
        {
            _contextForUser=[[NSManagedObjectContext alloc]initWithConcurrencyType:NSPrivateQueueConcurrencyType];
            [_contextForUser setPersistentStoreCoordinator:[self coordinatorwithIdentifier:identifer]];
        }
        return _contextForUser;
    }
    if ([identifer isEqualToString:NSStringFromClass([Pictures class])])
    {
        
        _contextForPics=[[NSManagedObjectContext alloc]initWithConcurrencyType:NSPrivateQueueConcurrencyType];
        [_contextForPics setPersistentStoreCoordinator:[self coordinatorwithIdentifier:identifer]];
        return _contextForPics;
    }
    return nil;
}
-(NSManagedObjectModel *)modelForUserInfor
{
    return [self modelWithIdentifier:NSStringFromClass([UserInfor class])];
}
-(NSManagedObjectModel *)modelForPictures
{
    return [self modelWithIdentifier:NSStringFromClass([Pictures class])];
}
-(NSManagedObjectModel *)modelWithIdentifier:(NSString *)identifier
{
    if ([identifier isEqualToString:NSStringFromClass([UserInfor class])])
    {
         NSURL *urlOfCoreDataFile=[[NSBundle mainBundle] URLForResource:NSStringFromClass([UserInfor class]) withExtension:@"momd"];
               _modelForUserInfor=[[NSManagedObjectModel alloc]initWithContentsOfURL:urlOfCoreDataFile];
        return _modelForUserInfor;
    }
//    if (_model==nil)
//    {
//        NSURL *urlOfCoreDataFile=[NSURL URLWithString:[[NSBundle mainBundle]pathForResource:@"UserInfor" ofType:@"xcdatamodeld"]];
//        _model=[[NSManagedObjectModel alloc]initWithContentsOfURL:urlOfCoreDataFile];
//    }
    if ([identifier isEqualToString:NSStringFromClass([Pictures class])])
    {
        NSURL *urlOfCoreDataFile=[[NSBundle mainBundle] URLForResource:NSStringFromClass([Pictures class]) withExtension:@"momd"];
        _modelForPictures=[[NSManagedObjectModel alloc]initWithContentsOfURL:urlOfCoreDataFile];
        return _modelForPictures;
    }
    return nil;
}
//
-(NSPersistentStoreCoordinator *)coordinatorwithIdentifier:(NSString *)identifier
{
    if ([identifier isEqualToString:NSStringFromClass([UserInfor class])])
    {
        if (_coordinatorForUser==nil)
        {
            _coordinatorForUser=[[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:[self modelWithIdentifier:identifier]];
        }
        NSURL *urlOfUserDatabase=[[self kgetTheDocumentDirectory] URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.sqlite",identifier]];
           NSLog(@"%@",urlOfUserDatabase.path);
           NSError *error;
           if (![_coordinatorForUser addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:urlOfUserDatabase options:nil error:&error])
           {
               NSLog(@"%@",error);
               abort();
           }
        return _coordinatorForUser;
    }
    if ([identifier isEqualToString:NSStringFromClass([Pictures class])])
    {
        if (_coordinatorForPics==nil)
        {
            _coordinatorForPics=[[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:[self modelWithIdentifier:identifier]];
        }
        
        NSURL *urlOfUserDatabase=[[self kgetTheDocumentDirectory] URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.sqlite",identifier]];
           NSLog(@"%@",urlOfUserDatabase.path);
           NSError *error;
           if (![_coordinatorForPics addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:urlOfUserDatabase options:nil error:&error])
           {
               NSLog(@"%@",error);
               abort();
           }
        return _coordinatorForPics;
    }
    return nil;
}
-(NSURL *)kgetTheDocumentDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask]lastObject];
}
-(NSPersistentContainer *)container
{
    if (_container==nil)
    {
        _container=[[NSPersistentContainer alloc]init];
    }
    return _container;
}
+(instancetype)shareInstance
{  static LzgSimpleNSFamilyDataStore *me;
    if (me==nil)
    {
        me=[[LzgSimpleNSFamilyDataStore alloc]init];
    }
    return me;
}
-(BOOL)saveTheDataOfImageWithUrlString:(NSString *)urlString andImage:(UIImage *)img
{
    NSFetchRequest *fetchRequst=[Pictures fetchRequest];
    NSEntityDescription *entity=[NSEntityDescription entityForName:NSStringFromClass([Pictures class]) inManagedObjectContext:self.contextForPics];
    NSError *fetchError;
    [fetchRequst setEntity:entity];
    NSArray *result=[self.contextForPics executeFetchRequest:fetchRequst error:&fetchError];
    if (fetchError)
    {
        NSLog(@"%@",fetchError);
        return NO;
    }
    Pictures *currentPic=[Pictures pictureWithUrlSource:urlString andImage:img];
    for (Pictures *obj in result)
    {
        if ([obj isEqual:currentPic])
        {
            return YES;
        }
    }
//////////////////////////////////
    Pictures *pic=(Pictures *)[NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([Pictures class]) inManagedObjectContext:[self contextWithIdentifier:NSStringFromClass([Pictures class])]];
//    Pictures *pic=(Pictures *)entity;
    pic.urlSource=urlString;
    pic.img=UIImagePNGRepresentation(img);
    NSError *error;
    [self ksaveCOntext:&error withIdentifier:NSStringFromClass([Pictures class])];
    if (error)
    {
        return NO;
    }
    return YES;
}

-(BOOL)saveTheDataOfUser:(NSString *)userid andTheName:(NSString *)name andTheQuitTime:(NSDate *)dateOfQuitTime logStatus:(BOOL) islog
{
    
    NSFetchRequest *fetchRequest=[UserInfor fetchRequest];
    NSEntityDescription *entity=[NSEntityDescription entityForName:NSStringFromClass([UserInfor class]) inManagedObjectContext:self.contextForUser];
    [fetchRequest setEntity:entity];
    NSError *fetchError;
    NSArray *arrayOfentity=[self.contextForUser executeFetchRequest:fetchRequest error:&fetchError];
    if (fetchError)
    {
        NSLog(@"%@",fetchError);
        abort();
    }
    UserInfor *currentinfor=[UserInfor userWithUserid:userid andUserName:name andDateOflastQuit:dateOfQuitTime andLogStatus:islog];
    for (UserInfor *obj in arrayOfentity)
    {
        if ([obj isEqual:currentinfor])
        {
            [obj setIsLogSatus:YES];
            [obj setTimeOfLastQuit:dateOfQuitTime];
            NSError *errorOfSave;
            [self ksaveCOntext:&errorOfSave withIdentifier:NSStringFromClass([UserInfor class])];
            if (errorOfSave)
            {
                return NO;
            }
            return YES;
        }
    }
    NSManagedObject *userInfor=[NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([UserInfor class]) inManagedObjectContext:[self contextWithIdentifier:NSStringFromClass([UserInfor class])]];
    NSNumber *islog_num=[NSNumber numberWithBool:islog];
    [userInfor setValue:userid forKey:@"userid"];
    [userInfor setValue:name forKey:@"name"];
    [userInfor setValue:dateOfQuitTime forKey:@"timeOfLastQuit"];
    [userInfor setValue:islog_num forKey:@"isLogSatus"];
    NSError *erro;
    [self ksaveCOntext:&erro withIdentifier:NSStringFromClass([UserInfor class])];
    if (erro)
    {
        return NO;
    }
    return YES;
}
-(Pictures *)picWithUrlString:(NSString *)urlString
{
    NSFetchRequest *fetchRequst=[Pictures fetchRequest];
    NSEntityDescription *desctiprtionOfPic=[NSEntityDescription entityForName:NSStringFromClass([Pictures class]) inManagedObjectContext:[self contextWithIdentifier:NSStringFromClass([Pictures class])]];
    Pictures *preObj=(Pictures*)desctiprtionOfPic;
    preObj.urlSource=urlString;
    NSError *error;
    [fetchRequst setEntity:desctiprtionOfPic];
  NSArray *result=(NSArray *)[[self contextWithIdentifier:NSStringFromClass([Pictures class])] executeRequest:fetchRequst error:&error];
    Pictures *obj=[result lastObject];
    return  obj;
}
-(UserInfor *)userWithId:(NSString *)idString
{
    NSFetchRequest *request=[UserInfor fetchRequest];
    UserInfor *decUserInfor=(UserInfor *)[NSEntityDescription entityForName:NSStringFromClass([UserInfor class]) inManagedObjectContext:[self contextWithIdentifier:NSStringFromClass([UserInfor class])]];
    decUserInfor.userid=idString;
    NSError *error;
    NSArray *result=(NSArray *)[[self contextWithIdentifier:NSStringFromClass([UserInfor class])] executeRequest:request error:&error];
    return result.lastObject;
}
-(UserInfor *)userWithName:(NSString *)name
{
    
    NSFetchRequest *request=[UserInfor fetchRequest];
    UserInfor *decUserInfor=(UserInfor *)[NSEntityDescription entityForName:NSStringFromClass([UserInfor class]) inManagedObjectContext:[self contextWithIdentifier:NSStringFromClass([UserInfor class])]];
    decUserInfor.name=name;
    NSError *error;
  NSArray *result=(NSArray *)[[self contextWithIdentifier:NSStringFromClass([UserInfor class])] executeRequest:request error:&error];
    if (error)
    {
        return nil;
    }
    return result.lastObject;
}
@end
