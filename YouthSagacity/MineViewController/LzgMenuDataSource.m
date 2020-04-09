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

@end
@implementation LzgMenuDataSource

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    LzgMineCell *cell=[[LzgMineCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([LzgMineCell class])];
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
    cell.cellTailPoint.image=[UIImage imageNamed:@"5_100"];

    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
@end
