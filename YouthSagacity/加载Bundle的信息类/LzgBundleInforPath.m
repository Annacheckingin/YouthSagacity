//
//  LzgBundleInforPath.m
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/3.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "LzgBundleInforPath.h"

@implementation LzgBundleInforPath
static LzgBundleInforPath *me;
+(instancetype)shareInstance
{
    if (me==nil)
    {
        me=[[LzgBundleInforPath alloc]init];
    }
    return me;
}
-(NSString *)pathOfImage:(NSString *)name
{
    NSBundle *mainbundle=[NSBundle mainBundle];
    NSString *pathOfImage;
    pathOfImage=[mainbundle pathForResource:name ofType:@"png"];
    if (pathOfImage==nil)
    {
        pathOfImage=[mainbundle pathForResource:name ofType:@"jpg"];
        if (pathOfImage==nil)
        {
            pathOfImage=[mainbundle pathForResource:name ofType:@"jpeg"];
        }
    }
    return pathOfImage;
}
-(NSString *)pathOfFile:(NSString *)fileName
{
    NSBundle *mainbundle=[NSBundle mainBundle];
    NSString *path=[mainbundle pathForResource:fileName ofType:nil];
    return path;
}
@end
