//
//  AppDelegate.m
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/1.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "NewsViewController.h"
#import "MineViewController.h"
#import "LzgRootTabBarController.h"
#import "LzgLogStatus.h"
#import "LzgLogViewController.h"
#import "LzgBabaBiServerManager.h"
@interface AppDelegate ()<UITabBarControllerDelegate>
@property(nonatomic,strong)LzgLogStatus *logstatus;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window=[[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _logstatus=[LzgLogStatus shareInstance];
    // Override point for customization after application launch.
    HomeViewController *homevc=[[HomeViewController alloc]init];
    NewsViewController *newvc=[[NewsViewController alloc]init];
    MineViewController *minevc=[[MineViewController alloc]init];
    NSArray *viewController=@[homevc,newvc,minevc];
    LzgRootTabBarController *rootBarVc=[LzgRootTabBarController allocAndSetTheViewControllers:viewController whitNavigationController:YES];
    [rootBarVc viewControllersSetTheTabBarItemImagesWithSequenceUnselectedBegin:@[
        
        [UIImage imageNamed:@"5_88"],[UIImage imageNamed:@"5_79"],[UIImage imageNamed:@"5_82"],[UIImage imageNamed:@"5_89"],[UIImage imageNamed:@"5_76"],[UIImage imageNamed:@"5_87"]

    ]];
    self.window.rootViewController=rootBarVc;
    rootBarVc.delegate=self;
    [LzgBabaBiServerManager setTheServerName:@"tusermen"];
    [self.window makeKeyAndVisible];
    return YES;
}
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    if (!_logstatus.islogging)
    {
        LzgLogViewController *logViewController=[LzgLogViewController shareInstance];
        [self.window.rootViewController presentViewController:logViewController animated:YES completion:nil];
    }
    else
    {
        return YES;
    }
    return NO;
}

#pragma mark - UISceneSession lifecycle





@end