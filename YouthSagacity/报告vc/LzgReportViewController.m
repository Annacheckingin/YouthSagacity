//
//  LzgReportViewController.m
//  YouthSagacity
//
//  Created by LiZhengGuo on 2020/4/14.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "LzgReportViewController.h"

@interface LzgReportViewController ()<UITextViewDelegate>
@property(nonatomic,strong)UITextField *kPlaceholderFiled;
@end

@implementation LzgReportViewController
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden=NO;
    [self.navigationController.navigationBar setTranslucent:NO];
}
-(instancetype)init
{
    if (self=[super init])
    {
       
        self.hidesBottomBarWhenPushed=YES;
        _kPlaceholderFiled=[[UITextField alloc]init];
        [_kPlaceholderFiled setEnabled:NO];
        NSAttributedString *atString=[[NSAttributedString alloc]initWithString:@"edit here" attributes:@{NSForegroundColorAttributeName:UIColor.lightGrayColor}];
        _kPlaceholderFiled.attributedPlaceholder=atString;
        _reportReason=[[UITextView alloc]init];
        _reportReason.layer.borderColor=UIColor.lightGrayColor.CGColor;
        _reportReason.layer.borderWidth=0.5;
        [_reportReason addSubview:_kPlaceholderFiled];
        _kPlaceholderFiled.sd_layout.leftEqualToView(_reportReason)
        .topEqualToView(_reportReason)
        .widthIs(100*LZGWIDTH)
        .heightIs(20*LZGHEIGHT);
        _reportReason.delegate=self;
        _submit=[[UIButton alloc]init];
        [_submit addTarget:self action:@selector(k_submit:) forControlEvents:UIControlEventTouchUpInside];
        [_submit setImage:[UIImage imageNamed:@"5_175"] forState:UIControlStateNormal];
        _submit.imageView.contentMode=UIViewContentModeScaleAspectFit;
    
    }
    return self;
}
-(void)k_submit:(UIButton *)sender
{
    
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"Success" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:alert animated:YES completion:^{
        sleep(1);
        [alert dismissViewControllerAnimated:YES completion:^{
             [self.navigationController popViewControllerAnimated:YES];
        }];
    }];
    
   
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=UIColor.whiteColor;
    [self.view sd_addSubviews:@[_reportReason,_submit]];
    _reportReason.sd_layout
    .topSpaceToView(self.view, 40*LZGHEIGHT)
    .leftSpaceToView(self.view, 20*LZGWIDTH)
    .rightSpaceToView(self.view, 20*LZGWIDTH)
    .heightIs(100*LZGHEIGHT);
    //
    
    _submit.sd_layout
    .topSpaceToView(_reportReason, 50*LZGHEIGHT)
    .leftEqualToView(_reportReason)
    .rightEqualToView(_reportReason)
    .heightIs(30*LZGHEIGHT);
    //
    //
    // Do any additional setup after loading the view.
}
-(void)textViewDidBeginEditing:(UITextView *)textView
{
    [_kPlaceholderFiled removeFromSuperview];
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
