//
//  LzgScroBaseViewController.h
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/1.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LzgBaseFunctionViewController.h"
typedef  void (^SDAutoLayoutModelBlock)(UIView * _Nonnull theview,UIView * _Nonnull theBaseView);
NS_ASSUME_NONNULL_BEGIN
//@class SDAutoLayoutModel;
@interface LzgScroBaseViewController :LzgBaseFunctionViewController
@property(nonatomic,readonly)UIScrollView *baseScroView;
-(CGSize)currentScroViewContent;
-(void)setTheScroViewContentSize:(CGSize)size;
-(CGPoint)currentOffSet;
-(void)setTheCurrentOffSet:(CGPoint)offset;
-(void)addTheViewInBottomView:(UIView *)aview andSDAutoLayoutModel:(SDAutoLayoutModelBlock) block;
@end

NS_ASSUME_NONNULL_END
