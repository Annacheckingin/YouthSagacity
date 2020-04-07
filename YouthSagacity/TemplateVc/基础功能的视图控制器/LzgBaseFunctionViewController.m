//
//  LzgBaseFunctionViewController.m
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/1.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "LzgBaseFunctionViewController.h"

@interface LzgBaseFunctionViewController ()

@end

@implementation LzgBaseFunctionViewController
-(instancetype)init
{
    if (self =[super init])
    {
        
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    UITapGestureRecognizer *tapGes=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(kKeyBoardDown:)];
    [self.view addGestureRecognizer:tapGes];
    // Do any additional setup after loading the view.
}
-(void)kKeyBoardDown:(UITapGestureRecognizer *)reg
{
    [[UIApplication sharedApplication].keyWindow endEditing:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
