//
//  HomeViewControllerCollectionVIewCell.h
//  YouthSagacity
//
//  Created by LiZhengGuo on 2020/4/8.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol HomeViewControllerCollectionVIewCellDelegate <NSObject>

-(void)HomeViewControllerCollectionVIewCellWarningTargetActionMethod:(UIButton *)sender;
-(void)HomeViewControllerCollectionVIewCellForBideTargetActionMethod:(UIButton *)sender;

@end
@interface HomeViewControllerCollectionVIewCell : UICollectionViewCell
@property(nonatomic,strong)UILabel *cellTitle;
@property(nonatomic,strong)UIImageView *cellImage;
@property(nonatomic,strong)UILabel *cellDate;
@property(nonatomic,strong)UILabel *cellAuthor;
@property(nonatomic,strong)UIButton *warnningBtn;
@property(nonatomic,strong)UIButton *forbidBtn;
@property(nonatomic,strong)UIButton *detailsBtn;
@property(nonatomic,weak) id <HomeViewControllerCollectionVIewCellDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
