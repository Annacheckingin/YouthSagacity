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
        _kcontainner=[NSMutableArray array];
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
            NSArray *temparray=[NSMutableArray arrayWithContentsOfFile:[pathToDocumentDirectory stringByAppendingFormat:@"/%@",likePlistName]];
                       for (NSDictionary *obj in temparray)
                       {
                           NSString *tt=obj[@"articleTitle"];
                           NSString  *ct=obj[@"content"];
                           NSString *img1=obj[@"image_1"];
                           NSString *img2=obj[@"image_2"];
                           NSString *img3=obj[@"image_3"];
                           NSString *date=obj[@"Date"];
                LikesModel *model=[[LikesModel alloc]initWithTitile:tt content:ct image1:img1 image2:img2 image3:img3 andDate:date];
                           [_kcontainner  addObject:model];
                       }
        }

    }
    return self;
}
-(void)p_save
{
    LzgSandBoxStore *store=[LzgSandBoxStore shareInstance];
    NSString *pathToDocumentDirectory=[store stringForSandBoxOfDocument];
    
    
  __block  NSMutableArray *tempArray=[NSMutableArray array];
    for (LikesModel *model in _kcontainner)
    {
        NSString *titleKey=@"articleTitle";
        NSString *contentKey=@"content";
        NSString *dateKey=@"Date";
        NSString *image_1Key=@"image_1";
        NSString *image_2Key=@"image_2";
        NSString *image_3Key=@"image_3";
        NSString *likeKey=@"like";
        NSMutableDictionary *tempDic=[[NSMutableDictionary alloc]initWithDictionary:@{
            titleKey:model.theLikes_title,
            contentKey:model.theLikes_content,
            dateKey:model.theDate,
            image_1Key:model.urlToImage1,
            image_2Key:model.urlToImage2,
            image_3Key:model.urlToimage3,
            likeKey:[NSNumber numberWithInt:1]
        }];
        [tempArray addObject:tempDic];
    }
    [tempArray writeToFile:[pathToDocumentDirectory stringByAppendingFormat:@"/%@",LzgLikesModelFileName] atomically:YES];
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
    
    [self p_save];

    
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
    [self p_save];
}
-(void)deleteAlikeAtIndex:(NSInteger)index
{
    [_kcontainner removeObjectAtIndex:index];
    [self p_save];
}
-(NSInteger)numOfLikes
{
    return _kcontainner.count;
}
-(NSMutableArray *)likes
{
    return _kcontainner;
}
@end
