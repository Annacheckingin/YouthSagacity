//
//  LikesModel.m
//  YouthSagacity
//
//  Created by LiZhengGuo on 2020/4/10.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "LikesModel.h"
@interface LikesModel ()
//@property(nonatomic,strong)NSString *theLikes_title;
//@property(nonatomic,strong)NSString *theLikes_content;
//@property(nonatomic,strong)NSString *urlToImage1;
//@property(nonatomic,strong)NSString *urlToImage2;
//@property(nonatomic,strong)NSString *urlToimage3;
@end
@implementation LikesModel
-(instancetype)init
{
    
    if (self=[super init])
    {
        
    }
    return self;
    
}
-(BOOL)isEqual:(id)object
{
    if ([self class]!=[object class])
    {
        return NO;
    }
    LikesModel *mode=(LikesModel *)object;
    if (![mode.theLikes_content isEqualToString:self.theLikes_content])
    {
        return NO;
    }
    if (![mode.theLikes_title isEqualToString:self.theLikes_title])
    {
        return NO;
    }
    return YES;
}
//-(instancetype)initlikesModelWithTitle:(NSString *)title andContent:(NSString *)content Image1Url:(NSString *)url Image2Url:(NSString *)url2 image3Url:(NSString *)url3
//{
//    if (title==nil&&content==nil&&url==nil&&url2==nil&&url3==nil)
//    {
//
//        NSString *stringOfReason=[NSString stringWithFormat:@"%s",_cmd];
//         @throw [NSException exceptionWithName:@"no appropriate initializer" reason:[NSString stringWithFormat:@"please Use %@ instead",stringOfReason] userInfo:nil];
//    }
//    self=[super init];
//}
@end
