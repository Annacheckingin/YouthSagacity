//
//  LzgPlistRead.m
//  YouthSagacity
//
//  Created by LiZhengGuo on 2020/4/8.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "LzgPlistRead.h"
@interface LzgPlistRead ()
{
    NSString *_fixedDataPath;
}
@property(nonatomic,strong)NSString *fixedDataPath;
@property(nonatomic,strong)NSString *test;
-(NSString *)kpathOffixedPlistFile;
@end
@implementation LzgPlistRead
@synthesize fixedDataPath;
-(NSString *)kpathOffixedPlistFile
{
    NSBundle *mainBundle=[NSBundle mainBundle];
  NSString *urlOfPlsit=[mainBundle pathForResource:@"FixedData" ofType:@"plist"];
    return urlOfPlsit;
}
-(void)setFixedDataPath:(NSString *)fixedDataPath
{
   _fixedDataPath=[self kpathOffixedPlistFile];
}
-(NSString *)fixedDataPath
{
    if (_fixedDataPath==nil)
    {
        _fixedDataPath=[self kpathOffixedPlistFile];
    }
    return _fixedDataPath;
}
+(instancetype)shareInstance
{
    static LzgPlistRead *me;
    if (me==nil)
    {
        me=[[LzgPlistRead alloc]init];
    }
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
