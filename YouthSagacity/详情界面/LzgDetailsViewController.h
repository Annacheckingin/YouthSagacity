//
//  LzgDetailsViewController.h
//  YouthSagacity
//
//  Created by LiZhengGuo on 2020/4/10.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "LzgBackBtnWithScroViewViewController.h"

NS_ASSUME_NONNULL_BEGIN
typedef void (^DetailPageDataBlock)(UIImageView *portarit,UILabel *name,UILabel *date,UILabel *content,UIImageView *contentImgae,UILabel *thumbNum);
@class LzgLabel;
@interface LzgDetailsViewController : LzgBackBtnWithScroViewViewController
@property(nonatomic,readonly)UIImageView *portraite;
@property(nonatomic,readonly) UILabel *authorName;
@property(nonatomic,readonly)UILabel *dateLabel;
@property(nonatomic,readonly)UIButton *forbidBtn;
@property(nonatomic,readonly)UIButton *reportBtn;
@property(nonatomic,readonly)UILabel *articleTitle;
@property(nonatomic,readonly)LzgLabel *content;
@property(nonatomic,readonly)UIImageView *contentImage;
@property(nonatomic,readonly)UILabel *thumbNums;
@property(nonatomic,weak,readwrite)id datasource;
@property(nonatomic,strong) DetailPageDataBlock hanleUI;
@end

NS_ASSUME_NONNULL_END
