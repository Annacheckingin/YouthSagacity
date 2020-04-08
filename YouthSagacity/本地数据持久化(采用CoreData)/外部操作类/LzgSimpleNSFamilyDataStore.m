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
        NSURL *urlOfUserDatabase=[[self kgetTheDocumentDirectory] URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.sqlite",NSStringFromClass([Pictures class])]];
               NSError *error;
               [_coordinatorForPics addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:urlOfUserDatabase options:nil error:&error];
               if (error)
               {
                   return nil;
               }
    }
    return _coordinatorForPics;
}
-(NSPersistentStoreCoordinator *)coordinatorForUser
{
    if (_coordinatorForUser==nil)
    {
        NSManagedObjectModel *mode=self.modelForUserInfor;
       
        _coordinatorForUser=[[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:self.modelForUserInfor];
       NSURL *urlOfUserDatabase=[[self kgetTheDocumentDirectory] URLByAppendingPathComponent:[NSString stringWithFormat:@"%@.sqlite",NSStringFromClass([UserInfor class])]];
        NSError *error;
        [_coordinatorForUser addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:urlOfUserDatabase options:nil error:&error];
        if (error)
        {
            abort();
            return nil;
        }
    }
    return _coordinatorForUser;
}
-(NSManagedObjectContext *)contextForPics
{
    if (_contextForPics==nil)
    {
        _contextForPics=[[NSManagedObjectContext alloc]initWithConcurrencyType:NSPrivateQueueConcurrencyType];
        [_contextForPics setPersistentStoreCoordinator:self.coordinatorForPics];
    }
    return _contextForPics;
}
-(NSManagedObjectContext *)contextForUser
{
    if (_contextForUser==nil)
    {
        _contextForUser=[[NSManagedObjectContext alloc]initWithConcurrencyType:NSPrivateQueueConcurrencyType];
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
               NSLog(@"Error Happened:%@",*error);
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
        if (_modelForUserInfor==nil)
        {
            NSURL *urlOfCoreDataFile=[[NSBundle mainBundle] URLForResource:NSStringFromClass([UserInfor class]) withExtension:@"momd"];
            _modelForUserInfor=[[NSManagedObjectModel alloc]initWithContentsOfURL:urlOfCoreDataFile];
        }
         
        return _modelForUserInfor;
    }
//    if (_model==nil)
//    {
//        NSURL *urlOfCoreDataFile=[NSURL URLWithString:[[NSBundle mainBundle]pathForResource:@"UserInfor" ofType:@"xcdatamodeld"]];
//        _model=[[NSManagedObjectModel alloc]initWithContentsOfURL:urlOfCoreDataFile];
//    }
    if ([identifier isEqualToString:NSStringFromClass([Pictures class])])
    {
        if (_modelForPictures==nil)
        {
    NSURL *urlOfCoreDataFile=[[NSBundle mainBundle] URLForResource:NSStringFromClass([Pictures class]) withExtension:@"momd"];
    _modelForPictures=[[NSManagedObjectModel alloc]initWithContentsOfURL:urlOfCoreDataFile];
        }
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
    NSURL *theurl=[[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask]lastObject];
    return theurl;
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

-(BOOL)saveTheDataOfUser:(NSString *)userid andTheName:(NSString *)name andPassword:(NSString *)password andTheQuitTime:(NSDate *)dateOfQuitTime logStatus:(BOOL) islog
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
    UserInfor *currentinfor=[UserInfor userWithUserid:userid andUserName:name andPassWord:password  andDateOflastQuit:dateOfQuitTime andLogStatus:islog withBlock:^(UserInfor * _Nonnull userinfor, NSManagedObjectContext * _Nonnull context)
    {
        
    }];
    for (UserInfor *obj in arrayOfentity)
    {
        
        if ([obj userIsEqual:currentinfor])
        {
            NSLog(@"userEqualAction:");
            [obj setIsLogSatus:YES];
            [obj setTimeOfLastQuit:dateOfQuitTime];
            [[[LzgSimpleNSFamilyDataStore shareInstance] contextWithIdentifier:NSStringFromClass([UserInfor class])] deleteObject:currentinfor];
            NSError *errorOfSave;
            
            [self ksaveCOntext:&errorOfSave withIdentifier:NSStringFromClass([UserInfor class])];
            if (errorOfSave)
            {
                return NO;
            }
            return YES;
        }

    }
#pragma mark 处理生成entity后造成的context的变化，及抵消这个变化
    [[[LzgSimpleNSFamilyDataStore shareInstance] contextWithIdentifier:NSStringFromClass([UserInfor class])] deleteObject:currentinfor];
               NSError *errorOfSave;
    [self ksaveCOntext:&errorOfSave withIdentifier:NSStringFromClass([UserInfor class])];
    //
#pragma mark 生成新的数据

    NSManagedObject *userInfor=[NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([UserInfor class]) inManagedObjectContext:[self contextWithIdentifier:NSStringFromClass([UserInfor class])]];
    NSNumber *islog_num=[NSNumber numberWithBool:islog];
    [userInfor setValue:userid forKey:@"userid"];
    [userInfor setValue:name forKey:@"name"];
    [userInfor setValue:dateOfQuitTime forKey:@"timeOfLastQuit"];
    [userInfor setValue:islog_num forKey:@"isLogSatus"];
    [userInfor setValue:password forKeyPath:@"password"];
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
//    Pictures *preObj=(Pictures*)desctiprtionOfPic;
//    preObj.urlSource=urlString;
    NSError *error;
    [fetchRequst setEntity:desctiprtionOfPic];
  NSArray *result=(NSArray *)[[self contextWithIdentifier:NSStringFromClass([Pictures class])] executeRequest:fetchRequst error:&error];
    for (Pictures *pic in result)
    {
        if ([pic.urlSource isEqualToString:urlString])
        {
            return pic;
        }
    }
    return  nil;
}
-(UserInfor *)userWithId:(NSString *)idString
{
    NSFetchRequest *request=[UserInfor fetchRequest];
    UserInfor *decUserInfor=(UserInfor *)[NSEntityDescription entityForName:NSStringFromClass([UserInfor class]) inManagedObjectContext:[self contextWithIdentifier:NSStringFromClass([UserInfor class])]];
    [request setEntity:(NSEntityDescription*)decUserInfor];
    NSError *error;
    NSManagedObjectContext *context=[self contextWithIdentifier:NSStringFromClass([UserInfor class])];
    NSArray *result=[context executeFetchRequest:request error:&error];
    for (UserInfor *userinfor in result)
    {
        if ([userinfor.userid isEqualToString:idString])
        {
            return userinfor;
        }
    }
    return nil;
}
-(UserInfor *)userWithName:(NSString *)name
{
    
    NSFetchRequest *request=[UserInfor fetchRequest];
    UserInfor *decUserInfor=(UserInfor *)[NSEntityDescription entityForName:NSStringFromClass([UserInfor class]) inManagedObjectContext:[self contextWithIdentifier:NSStringFromClass([UserInfor class])]];
    [request setEntity:(NSEntityDescription *)decUserInfor];
    NSError *error;
    NSArray *result=[[self contextWithIdentifier:NSStringFromClass([UserInfor class])] executeFetchRequest:request error:&error];
    if (error)
    {
        return nil;
    }
    for (UserInfor *userobj in result)
    {
        if ([userobj.name isEqualToString:name])
        {
            return userobj;
        }
    }
    
    return nil;
}
-(BOOL)hasPics
{
    return NO;
}
-(BOOL)hasLogUser
{
    NSEntityDescription *entity=[NSEntityDescription entityForName:NSStringFromClass([UserInfor class]) inManagedObjectContext:self.contextForUser];
    NSFetchRequest *fetch=[UserInfor fetchRequest];
    [fetch setEntity:entity];
    NSError *fetchError;
 NSArray *fetchresult=[self.contextForUser executeFetchRequest:fetch error:&fetchError];
    if (fetchError)
    {
        NSLog(@"%@",fetchError);
        abort();
    }
    if (fetchresult.count==0)
    {
        return NO;
    }
    UserInfor *theonlyUser=[fetchresult lastObject];
    BOOL islog=theonlyUser.isLogSatus;
    return islog;
}
@end
