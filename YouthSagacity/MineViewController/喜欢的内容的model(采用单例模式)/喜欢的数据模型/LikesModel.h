//
//  LikesModel.h
//  YouthSagacity
//
//  Created by LiZhengGuo on 2020/4/10.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LikesModel : NSObject
@property(nonatomic,strong)NSString *theLikes_title;
@property(nonatomic,strong)NSString *theLikes_content;
@property(nonatomic,strong)NSString *urlToImage1;
@property(nonatomic,strong)NSString *urlToImage2;
@property(nonatomic,strong)NSString *urlToimage3;
-(instancetype)initWithTitile:(NSString *)tile content:(NSString *)content image1:(NSString *)urlimge1 image2:(NSString *)urlimage2 image3:(NSString *)urlimage3;
//-(instancetype)initlikesModelWithTitle:(NSString *)title andContent:(NSString *)content Image1Url:(NSString *)url Image2Url:(NSString *)url2 image3Url:(NSString *)url3;
@end

NS_ASSUME_NONNULL_END
