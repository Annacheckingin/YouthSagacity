//
//  LzgBackBtnWithScroViewViewController.h
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/1.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "LzgScroBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface LzgBackBtnWithScroViewViewController :LzgScroBaseViewController
@property(nonatomic,readonly)UIButton *backButton;
+(void)configureTheBackBtnImage:(UIImage *)image;
-(void)setInstanceImage:(UIImage *)image;
+(void)initialize;
@end

NS_ASSUME_NONNULL_END
