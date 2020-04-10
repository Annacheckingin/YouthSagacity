//
//  LzgMessageCenter.m
//  YouthSagacity
//
//  Created by LiZhengGuo on 2020/4/10.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "LzgMessageCenter.h"
#import "LzgSandBoxStore.h"
const NSString *LzgMSModelFileName=@"MS.plist";
@interface LzgMessageCenter ()
@property(nonatomic,strong)NSMutableArray* k_MSContainer;
@end
@implementation LzgMessageCenter
+(instancetype)shareInstance
{
    LzgMessageCenter *me;
    if (me==nil)
    {
        me=[[LzgMessageCenter alloc]init];
        
    }
    return me;
}
-(instancetype)init
{
    if (self=[super init])
    {
        LzgSandBoxStore *store=[LzgSandBoxStore shareInstance];
        NSString *pathToDocumentDirectory=[store stringForSandBoxOfDocument];
        NSString *likePlistName=LzgMSModelFileName;
        if (![store fileExistInDocumentDirectoryWithName:likePlistName])
        {
            NSMutableArray *emptyArray=[NSMutableArray array];
            NSFileManager *FM=[NSFileManager defaultManager];
            [FM createFileAtPath:[pathToDocumentDirectory stringByAppendingFormat:@"/%@",likePlistName] contents:[NSKeyedArchiver archivedDataWithRootObject:emptyArray] attributes:nil];
        }
        else
        {
            _k_MSContainer =[NSMutableArray arrayWithContentsOfFile:[pathToDocumentDirectory stringByAppendingFormat:@"/%@",likePlistName]];
        }
    }
    return self;
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
       LzgSandBoxStore *store=[LzgSandBoxStore shareInstance];
             NSString *pathToDocumentDirectory=[store stringForSandBoxOfDocument];
         [_k_MSContainer writeToFile:[pathToDocumentDirectory stringByAppendingFormat:@"/%@",LzgMSModelFileName] atomically:YES];
}
-(NSInteger)numOfMesages
{
    return _k_MSContainer.count;
}
@end
