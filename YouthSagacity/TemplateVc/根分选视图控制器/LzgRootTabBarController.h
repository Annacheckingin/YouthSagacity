//
//  LzgRootTabBarController.h
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/1.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LzgRootTabBarController : UITabBarController
+(instancetype)allocAndSetTheViewControllers:(NSArray *)viewControllers whitNavigationController:(BOOL)yesornot;
-(void)viewControllersSetTheTabBarItemImagesWithSequenceUnselectedBegin:(NSArray <UIImage *>*)images;
+(instancetype)shareInstance;
@end

NS_ASSUME_NONNULL_END
