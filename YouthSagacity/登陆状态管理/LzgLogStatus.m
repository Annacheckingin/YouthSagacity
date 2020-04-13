//
//  LzgLogStatus.m
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/2.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "LzgLogStatus.h"
#import "LzgSimpleNSFamilyDataStore.h"
#import "LzgSandBoxStore.h"
#import "UserInfor+CoreDataProperties.h"


@interface LzgLogStatus ()
{
    NSString *_currentLogName;
}
@property(nonatomic,assign) BOOL islogging;
@property(nonatomic,strong)LzgSimpleNSFamilyDataStore *storeCenter;
@property(nonatomic,assign)BOOL freshedData;

-(BOOL)kaccessTheData;
@end

const NSString *LzgLogStatusUserPlistFileName=@"CurrentLogger";
@implementation LzgLogStatus
static LzgLogStatus *me;
+(instancetype)shareInstance
{
    if (me==nil)
    {
        me=[[LzgLogStatus alloc]init];
        
    }
    return me;
}
-(instancetype)init
{
    if (self=[super init])
    {
        _islogging=NO;
        _freshedData=NO;
        LzgSandBoxStore *sandStore=[LzgSandBoxStore shareInstance];
        NSString *pathToDocDy=[sandStore stringForSandBoxOfDocument];
        NSString *userPlistFileName=[NSString stringWithFormat:@"/%@",LzgLogStatusUserPlistFileName];
        if (![sandStore fileExistInDocumentDirectoryWithName:userPlistFileName])
        {
            _currentLogName=nil;
        }
        _currentLogName=[NSString stringWithContentsOfFile:pathToDocDy usedEncoding:NSUTF8StringEncoding error:nil];
    }
    return self;
}
-(LzgSimpleNSFamilyDataStore *)storeCenter
{
    if (_storeCenter==nil)
    {
        _storeCenter=[LzgSimpleNSFamilyDataStore shareInstance];
    }
    return _storeCenter;
}
-(BOOL)kaccessTheData
{
    _freshedData=YES;
    return  [self.storeCenter hasLogUser:^(NSString * _Nonnull userName)
    {
        
    }];
}
-(BOOL)hasLogged
{
    
    if (_freshedData==NO)
    {
        _islogging=YES;
        return  [self kaccessTheData];
    }
    return _islogging;
}

-(void)setLoggingStatus:(BOOL)status WithId:(NSString *)userid anduserName:(NSString *)userName andPassword:(nonnull NSString *)password;
{
    self.islogging=status;
    [self.storeCenter saveTheDataOfUser:userid andTheName:userName andPassword:password  andTheQuitTime:[NSDate date] logStatus:status];
     _freshedData=NO;
}
-(void)setCurrentLogName:(NSString *)currentLogName
{
    LzgSandBoxStore *sandStore=[LzgSandBoxStore shareInstance];
    NSString *pathToDocDy=[sandStore stringForSandBoxOfDocument];
    NSString *userPlistFileName=[NSString stringWithFormat:@"/%@",LzgLogStatusUserPlistFileName];
    _currentLogName=currentLogName;
    if (![sandStore fileExistInDocumentDirectoryWithName:userPlistFileName])
    {
        NSFileManager *FM=[NSFileManager defaultManager];
        [FM createFileAtPath:userPlistFileName contents:[NSKeyedArchiver archivedDataWithRootObject:currentLogName] attributes:nil];
    }
    [currentLogName writeToFile:userPlistFileName atomically:YES];
}
-(NSString  *)currentLogName
{
    if (_currentLogName==nil)
    {
        LzgSandBoxStore *sandStore=[LzgSandBoxStore shareInstance];
        NSString *pathToDocDy=[sandStore stringForSandBoxOfDocument];
        NSString *userPlistFileName=[NSString stringWithFormat:@"/%@",LzgLogStatusUserPlistFileName];
        NSString *Aloger=[NSString stringWithContentsOfFile:userPlistFileName encoding:NSUTF8StringEncoding error:nil];
        _currentLogName=Aloger;
    }
    return _currentLogName;
}
-(void)changeTheCurrentLoggerStatus:(BOOL)status
{
    _islogging=status;
    UserInfor *currentUser=[self.storeCenter userWithName:_currentLogName];
    if (currentUser)
    {
         currentUser.isLogSatus=status;
           [self.storeCenter saveTheDataOfUser:currentUser.userid andTheName:currentUser.name andPassword:currentUser.password andTheQuitTime:currentUser.timeOfLastQuit logStatus:status];
    }
    else{
        return;
    }
   
      
}
@end
