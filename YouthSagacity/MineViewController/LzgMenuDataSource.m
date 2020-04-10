//
//  LzgMenuDataSource.m
//  YouthSagacity
//
//  Created by LiZhengGuo on 2020/4/9.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "LzgMenuDataSource.h"
#import "LzgMineCell.h"
@interface LzgMenuDataSource ()<UITableViewDataSource>
@property(nonatomic,weak)id tablev;
@end
@implementation LzgMenuDataSource
-(instancetype)init
{
    if (self=[super init])
    {
        NSLog(@"data");
    }
    return self;
}
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    LzgMineCell *cell=[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([LzgMineCell class])];
    self.tablev=tableView;
    if (cell==nil)
    {
        cell= [[LzgMineCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([LzgMineCell class])];
    }
    
    switch (indexPath.section)
    {
        case 0:
            cell.cellContent.text=@"help";
            cell.cellPortarite.image=[UIImage imageNamed:@"5_97"];
            break;
        case 1:
            cell.cellContent.text=@"Quit";
            cell.cellPortarite.image=[UIImage imageNamed:@"5_112"];
            break;
          
    }
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(p_actionTargetDispathch:)];
    [cell addGestureRecognizer:tap];
    cell.cellTailPoint.image=[UIImage imageNamed:@"5_100"];

    return cell;
}
-(void)p_actionTargetDispathch:(UITapGestureRecognizer *)tap
{
    UITableViewCell *cell=(UITableViewCell *)tap.view;
    UITableView *tabv=(UITableView *)self.tablev;
    [tabv.delegate tableView:self.tablev didSelectRowAtIndexPath:[tabv indexPathForCell:cell]];
}
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
@end
