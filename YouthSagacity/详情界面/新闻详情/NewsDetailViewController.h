//
//  NewsDetailViewController.h
//  YouthSagacity
//
//  Created by LiZhengGuo on 2020/4/10.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "LzgBackBtnWithScroViewViewController.h"

NS_ASSUME_NONNULL_BEGIN
@class LzgLabel;
typedef void  (^NewsDetailViewControllerUIHandle)(UILabel *title, LzgLabel *content,UIImageView *img_1,UIImageView *img_2,UIImageView *img_3,UIView *basementView,UIButton *blocking);
@protocol NewsDetailViewControllerDelegate <NSObject>
@required
-(void)NewsDetailViewControllerDelegateLikeAction:(UIButton *)sender;
-(void)NewsDetailViewControllerDelegateBlockingAction:(UIButton *)sender;

@end
@interface NewsDetailViewController : LzgBackBtnWithScroViewViewController
@property(nonatomic,readonly)UILabel *newsTitle;
@property(nonatomic,readonly)UIButton *blockingBtn;
@property(nonatomic,readonly)UIButton *likesBtn;
@property(nonatomic,readonly)LzgLabel *content;
@property(nonatomic,readonly)UIImageView *img_1;
@property(nonatomic,readonly)UIImageView *img_2;
@property(nonatomic,readonly)UIImageView *img_3;
@property(nonatomic,strong) NewsDetailViewControllerUIHandle handleUi;
@property(nonatomic,weak) id<NewsDetailViewControllerDelegate> delegate;
@property(nonatomic,copy)NSIndexPath *comeFromCellIndex;
@end

NS_ASSUME_NONNULL_END
