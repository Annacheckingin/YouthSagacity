//
//  LzgBaseWithBackButtonViewController.m
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/1.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "LzgBaseWithBackButtonViewController.h"
#import "UIViewController+LzgBackButtonImage.h"
 static UIImage *backbtnimage;
@interface LzgBaseWithBackButtonViewController ()
{
@protected
    UIImage *_instanceImage;
    UIButton *_backBtn;
}
@property(nonatomic,strong)UIImage *instanceImage;
@property(nonatomic,strong) UIButton *backBtn;
@end

@implementation LzgBaseWithBackButtonViewController
-(void)setInstanceImage:(UIImage *)image
{
    _instanceImage=image;
}
-(instancetype)init
{
    if (self =[super init])
    {
        _backBtn=[[UIButton alloc]init];
        [_backBtn addTarget:self action:@selector(kbackAction:) forControlEvents:UIControlEventTouchUpInside];
        UIImage *aimge=[LzgBaseWithBackButtonViewController theBackButtonImage];
        if (aimge)
        {
            [_backBtn setImage:aimge forState:UIControlStateNormal];
        }
        else
        {
            if (_instanceImage)
            {
                [_backBtn setImage:_instanceImage forState:UIControlStateNormal];
            }
        }
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated
{
    [self.navigationController.navigationBar setHidden:YES];
}
-(void)kbackAction:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
+(void)configureTheBackBtnImage:(UIImage *)image
{
   
    [LzgBaseWithBackButtonViewController setTheBackButtonImage:image];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:_backBtn];
    _backBtn.sd_layout
    .leftSpaceToView(self.view, 15*LZGWIDTH)
    .topSpaceToView(self.view, 15*LZGHEIGHT)
    .widthIs(25*LZGWIDTH)
    .heightIs(15*LZGHEIGHT);
    // Do any additional setup after loading the view.
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
