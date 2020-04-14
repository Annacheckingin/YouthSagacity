//
//  LzgBaseWithBackButtonViewController.h
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/1.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "LzgBaseFunctionViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface LzgBaseWithBackButtonViewController : LzgBaseFunctionViewController
+(void)configureTheBackBtnImage:(UIImage *)image;
-(void)setInstanceImage:(UIImage *)image;
+(void)initialize;
@property(nonatomic,readonly) UIButton *backBtn;
@end

NS_ASSUME_NONNULL_END
