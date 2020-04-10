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
@interface LzgMenuDelegate()<UITableViewDelegate>

@end
@implementation LzgMenuDelegate
-(instancetype)init
{
    if (self=[super init])
    {
        NSLog(@"dele");
    }
    return self;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"okl");
    if (indexPath.section==0)
    {
        
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
    NSLog(@"%s",sel_getName(_cmd));
    UITableView *tablev=self.belongto;
    return  [tablev cellHeightForIndexPath:indexPath cellContentViewWidth:SCREENWIDTH tableView:tablev];
    
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    NSLog(@"%s",sel_getName(_cmd));
    return [UIView new];
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSLog(@"%s",sel_getName(_cmd));
    return [UIView new];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    NSLog(@"%s",sel_getName(_cmd));
    return 10*LZGHEIGHT;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    NSLog(@"%s",sel_getName(_cmd));
    return 10*LZGHEIGHT;
}
@end
