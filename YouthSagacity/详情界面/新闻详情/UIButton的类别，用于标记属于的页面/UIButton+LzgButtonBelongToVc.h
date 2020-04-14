//
//  UIButton+LzgButtonBelongToVc.h
//  YouthSagacity
//
//  Created by LiZhengGuo on 2020/4/14.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//




#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (LzgButtonBelongToVc)
@property(nonatomic,weak,readwrite) id belongToVc;
@end

NS_ASSUME_NONNULL_END
