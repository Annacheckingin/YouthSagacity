//
//  LzgMessageCenter.m
//  YouthSagacity
//
//  Created by LiZhengGuo on 2020/4/10.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "LzgMessageCenter.h"
#import "LzgSandBoxStore.h"
#import "LzgBundleInforPath.h"
const NSString *LzgMSModelFileName=@"message.plist";
const NSString *LzgMSModelPortraitKey=@"potrait";
const NSString *LzgMSModelNameKey=@"name";
const NSString *lzgMSModeContentkey=@"content";
@interface LzgMessageCenter ()
@property(nonatomic,strong)NSMutableArray* k_MSContainer;
@end
@implementation LzgMessageCenter
+(instancetype)shareInstance
{
//   __block LzgMessageCenter *LzgMessageCenterme;
//    static  dispatch_once_t once;
//    if (LzgMessageCenterme==nil)
//    {
//    dispatch_once(&once, ^{
//    LzgMessageCenterme=[[self alloc]init];
//    });
//    }
//
//    return LzgMessageCenterme;
    static  LzgMessageCenter *LzgMessageCenterme;
    if (LzgMessageCenterme ==nil)
    {
        LzgMessageCenterme=[[self alloc]init];
    }
    return LzgMessageCenterme;
}
-(instancetype)init
{
    if (self=[super init])
    {
        
        _k_MSContainer=[NSMutableArray array];
        LzgSandBoxStore *store=[LzgSandBoxStore shareInstance];
        NSString *pathToDocumentDirectory=[store stringForSandBoxOfDocument];
        NSString *likePlistName=LzgMSModelFileName;
        NSFileManager *FM=[NSFileManager defaultManager];
        NSString *hardInforInBundle=[[LzgBundleInforPath shareInstance] pathOfFile:likePlistName];
//        BOOL isFileExsit=[FM fileExistsAtPath:[pathToDocumentDirectory stringByAppendingFormat:@"/%@",likePlistName]];
        NSData *dataOfPlist=[NSData dataWithContentsOfFile:hardInforInBundle];
        if (![store fileExistInDocumentDirectoryWithName:likePlistName])
        {
           
            
            //
//            NSString *fileName=@"message.plist";
//            NSString *hardInforInBundle=[[LzgBundleInforPath shareInstance] pathOfFile:fileName];
//            NSString *pathOfSandBoxDocumentDirectory=[[LzgSandBoxStore shareInstance] stringForSandBoxOfDocument];
//            NSFileManager *fileManager=[NSFileManager defaultManager];
//            BOOL isFileExsit=[fileManager fileExistsAtPath:[pathOfSandBoxDocumentDirectory stringByAppendingFormat:@"/%@",fileName]];
//            NSData *dataOfPlist=[NSData dataWithContentsOfFile:hardInforInBundle];
            //
            [FM createFileAtPath:[pathToDocumentDirectory stringByAppendingFormat:@"/%@",likePlistName] contents:dataOfPlist attributes:nil];
            //
            
            NSArray *temparray=[NSMutableArray arrayWithContentsOfFile:[pathToDocumentDirectory stringByAppendingFormat:@"/%@",likePlistName]];
            for (NSDictionary *obj in temparray)
            {
                NSString *portarit=[obj  objectForKey:LzgMSModelPortraitKey];
                NSString   *name=[obj  objectForKey:LzgMSModelNameKey];
                NSString *content=[obj objectForKey:lzgMSModeContentkey];
                LzgMessageModel *modle=[[LzgMessageModel alloc]initWithPortraite:portarit andName:name andBody:content];
                [_k_MSContainer addObject:modle];
            }
            
        }
        else
        {
            NSArray *temparray=[NSMutableArray arrayWithContentsOfFile:[pathToDocumentDirectory stringByAppendingFormat:@"/%@",likePlistName]];
            for (NSDictionary *obj in temparray)
            {
                NSString *portarit=[obj  objectForKey:@"potrait"];
                NSString   *name=[obj  objectForKey:@"name"];
                NSString *content=[obj objectForKey:@"content"];
                LzgMessageModel *modle=[[LzgMessageModel alloc]initWithPortraite:portarit andName:name andBody:content];
                [_k_MSContainer addObject:modle];
                
            }
            
//            _k_MSContainer =[NSMutableArray arrayWithContentsOfFile:[pathToDocumentDirectory stringByAppendingFormat:@"/%@",likePlistName]];
        }
    }
    return self;
}
-(void)P_storeOrFetchData
{
    
}
-(void)saveMessage:(LzgMessageModel *)aMessage
{
    [_k_MSContainer addObject:aMessage];
    LzgSandBoxStore *store=[LzgSandBoxStore shareInstance];
     NSString *pathToDocumentDirectory=[store stringForSandBoxOfDocument];
    [_k_MSContainer writeToFile:[pathToDocumentDirectory stringByAppendingFormat:@"/%@",LzgMSModelFileName] atomically:YES];
}
-(void)deleteALike:(LzgMessageModel *)aMS
{
    for (LzgMessageModel *obj in _k_MSContainer )
    {
        if ([obj isEqual:aMS])
        {
            [_k_MSContainer  removeObject:obj];
        }
    }
    LzgSandBoxStore *store=[LzgSandBoxStore shareInstance];
     NSString *pathToDocumentDirectory=[store stringForSandBoxOfDocument];
    [_k_MSContainer writeToFile:[pathToDocumentDirectory stringByAppendingFormat:@"/%@",LzgMSModelFileName] atomically:YES];
}
-(void)deleteAMSAtIndex:(NSInteger)index
{
    [_k_MSContainer removeObjectAtIndex:index];
    NSLog(@"%@",_k_MSContainer);
    LzgSandBoxStore *store=[LzgSandBoxStore shareInstance];
    NSString *pathToDocumentDirectory=[store stringForSandBoxOfDocument];
    NSLog(@"数据持久化开始");
    NSMutableArray *mutableContainnerArray=[NSMutableArray array];
    for (LzgMessageModel *obj in _k_MSContainer)
    {
        NSDictionary *fileDic=@{LzgMSModelPortraitKey:obj.urlofPortraite
                                ,
                                LzgMSModelNameKey:obj.nameOfUser
                                ,lzgMSModeContentkey:obj.mesageBody
        };
        [mutableContainnerArray addObject:fileDic];
    }
    
BOOL  succed=[mutableContainnerArray writeToFile:[pathToDocumentDirectory stringByAppendingFormat:@"/%@",LzgMSModelFileName] atomically:NO];
    
    
    NSLog(@"数据持久化结束");
    if (!succed) {
        NSLog(@"存储出错！");
    }
    NSLog(@"现在有的数据:%@",_k_MSContainer);
}
-(NSInteger)numOfMesages
{
    return _k_MSContainer.count;
}
-( NSMutableArray <LzgMessageModel *>*)messages
{
    return _k_MSContainer;
}
@end
