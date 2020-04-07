//
//  LzgCategoryValueHandler.m
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/2.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "LzgCategoryValueHandler.h"

@implementation LzgCategoryValueHandler
static  LzgCategoryValueHandler *me;
+(instancetype)shareInstance
{
    if (me==nil)
    {
        me=[[LzgCategoryValueHandler alloc]init];
    }
    return me;
}
-(id)dictionaryOrArrayWithResonseObjec:(id)resonseObject
{
    NSDictionary *returnedValue=(NSDictionary *)resonseObject;
    NSDictionary *theDataField=returnedValue[@"data"];
    if ([theDataField isKindOfClass:[NSDictionary class]])
    {
        NSDictionary *dic=(NSDictionary *)theDataField;
        return  dic;
    }
    if ([theDataField isKindOfClass:[NSArray class]])
    {
        NSArray *array=(NSArray *)theDataField;
        return array;
    }
    return nil;
}
@end
