//
//  LzgSandBoxStore.m
//  YouthSagacity
//
//  Created by LiZhengGuo on 2020/4/8.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "LzgSandBoxStore.h"

@implementation LzgSandBoxStore
+(instancetype)shareInstance
{
    static LzgSandBoxStore *me;
    if (me==nil)
    {
        me=[[LzgSandBoxStore alloc]init];
    }
    return me;
}
-(NSString *)stringForSandBoxOfDocument
{
   NSFileManager *fileManager=[NSFileManager defaultManager];
   NSURL *urlToDocument=[fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask].lastObject;
    NSLog(@"%@",urlToDocument.path);
    return urlToDocument.path;
}
@end
