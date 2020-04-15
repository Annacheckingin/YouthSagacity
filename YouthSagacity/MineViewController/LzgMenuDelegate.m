//
//  LzgMenuDelegate.m
//  YouthSagacity
//
//  Created by LiZhengGuo on 2020/4/9.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "LzgMenuDelegate.h"
#import "LzgLogViewController.h"
#import "LzgLogStatus.h"
#import "LzgHelpVc.h"
@interface LzgMenuDelegate()<UITableViewDelegate>

@end
@implementation LzgMenuDelegate
-(instancetype)init
{
    if (self=[super init])
    {
      
    }
    return self;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"ok");
    if (indexPath.section==0)
    {
        LzgHelpVc *helpVc=[[LzgHelpVc alloc]init];
        UITabBarController *tabVc=[UIApplication sharedApplication].keyWindow.rootViewController;
        UINavigationController *naviVc=tabVc.viewControllers.lastObject;
        [naviVc pushViewController:helpVc animated:YES];
    }
    
    else if(indexPath.section==1)
    {
        LzgLogViewController *logvc=[LzgLogViewController shareInstance];
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:logvc animated:YES completion:^
        {
            [[LzgLogStatus shareInstance] changeTheCurrentLoggerStatus:NO];
        }];
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableView *tablev=self.belongto;
    return  [tablev cellHeightForIndexPath:indexPath cellContentViewWidth:SCREENWIDTH tableView:tablev];
    
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
   
    return [UIView new];
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    return [UIView new];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
   
    return 10*LZGHEIGHT;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    
    return 10*LZGHEIGHT;
}
@end
