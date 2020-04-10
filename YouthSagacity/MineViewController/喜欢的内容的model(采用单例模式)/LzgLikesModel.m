//
//  LzgLikesModel.m
//  YouthSagacity
//
//  Created by LiZhengGuo on 2020/4/10.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "LzgLikesModel.h"
#import "LzgSandBoxStore.h"

const NSString *LzgLikesModelFileName=@"likes.plist";
@interface LzgLikesModel()
@property(nonatomic,strong)NSMutableArray *kcontainner;
@end
@implementation LzgLikesModel
-(instancetype)init
{
    if (self=[super init])
    {
        LzgSandBoxStore *store=[LzgSandBoxStore shareInstance];
        NSString *pathToDocumentDirectory=[store stringForSandBoxOfDocument];
        NSString *likePlistName=LzgLikesModelFileName;
        if (![store fileExistInDocumentDirectoryWithName:likePlistName])
        {
            NSMutableArray *emptyArray=[NSMutableArray array];
            NSFileManager *FM=[NSFileManager defaultManager];
            [FM createFileAtPath:[pathToDocumentDirectory stringByAppendingFormat:@"/%@",likePlistName] contents:[NSKeyedArchiver archivedDataWithRootObject:emptyArray] attributes:nil];
        }
        else
        {
            _kcontainner =[NSMutableArray arrayWithContentsOfFile:[pathToDocumentDirectory stringByAppendingFormat:@"/%@",likePlistName]];
        }

    }
    return self;
}

+(instancetype)shareInstance
{
    static LzgLikesModel *me;
    if (me==nil)
    {
        me=[[LzgLikesModel alloc]init];
    }
    return me;
}
-(void)saveAlike:(LikesModel *)alike
{
    [_kcontainner addObject:alike];
    LzgSandBoxStore *store=[LzgSandBoxStore shareInstance];
     NSString *pathToDocumentDirectory=[store stringForSandBoxOfDocument];
    [_kcontainner writeToFile:[pathToDocumentDirectory stringByAppendingFormat:@"/%@",LzgLikesModelFileName] atomically:YES];
    
}
-(void)deleteALike:(LikesModel *)alike
{
    for (LikesModel *obj in _kcontainner)
    {
        if ([obj isEqual:alike])
        {
            [_kcontainner removeObject:obj];
        }
    }
    LzgSandBoxStore *store=[LzgSandBoxStore shareInstance];
        NSString *pathToDocumentDirectory=[store stringForSandBoxOfDocument];
    [_kcontainner writeToFile:[pathToDocumentDirectory stringByAppendingFormat:@"/%@",LzgLikesModelFileName] atomically:YES];
}
-(void)deleteAlikeAtIndex:(NSInteger)index
{
    [_kcontainner removeObjectAtIndex:index];
    LzgSandBoxStore *store=[LzgSandBoxStore shareInstance];
          NSString *pathToDocumentDirectory=[store stringForSandBoxOfDocument];
      [_kcontainner writeToFile:[pathToDocumentDirectory stringByAppendingFormat:@"/%@",LzgLikesModelFileName] atomically:YES];
}
-(NSInteger)numOfLikes
{
    return _kcontainner.count;
}
@end
