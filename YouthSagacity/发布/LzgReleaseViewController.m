//
//  LzgReleaseViewController.m
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/1.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "LzgReleaseViewController.h"
FOUNDATION_EXTERN
const NSString *LzgReleaseViewControllerNotificationName=@"LzgReleaseViewControllerNotificationName";
@interface LzgReleaseViewController ()<UITextViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property(nonatomic,strong)UITextField *textViewPlaceHolderLabel;
@property(nonatomic,strong)UITextView *textArea;
@property(nonatomic,strong)UIButton *picImage_1;
@property(nonatomic,strong)UIButton *picImage_2;
@property(nonatomic,strong)UIButton *picImage_3;
@property(nonatomic,strong)UIButton *publish;
@property(nonatomic,weak)UIButton *selecBtn;
@property(nonatomic,strong)UITextField *ktitle;
@end

@implementation LzgReleaseViewController
-(instancetype)init
{
    if (self=[super init])
    {
        _ktitle=[[UITextField alloc]init];
        NSAttributedString *AttibutedString=[[NSAttributedString alloc]initWithString:@"Title" attributes:@{NSForegroundColorAttributeName:UIColor.lightGrayColor,NSFontAttributeName:[UIFont fontWithName:@"CourierNewPS-BoldMT" size:11]}];
        
        _ktitle.attributedPlaceholder=AttibutedString;
        NSAttributedString *attributedString=[[NSAttributedString alloc]initWithString:@"saySomething!"];
        _textViewPlaceHolderLabel=[[UITextField alloc]init];
        [_textViewPlaceHolderLabel setEnabled:NO];
        
        _textViewPlaceHolderLabel.attributedPlaceholder=attributedString;
        self.hidesBottomBarWhenPushed=YES;
        _textArea=[[UITextView alloc]init];
//        _textArea.text=@"say somthing!";
        _textArea.delegate=self;
        _picImage_1=[[UIButton alloc]init];
        _picImage_2=[[UIButton alloc]init];
        _picImage_3=[[UIButton alloc]init];
        _picImage_1.imageView.contentMode=UIViewContentModeScaleAspectFit;
        _picImage_2.imageView.contentMode=_picImage_1.imageView.contentMode;
        _picImage_3.imageView.contentMode=_picImage_1.imageView.contentMode;
        [_picImage_1 setImage:[UIImage imageNamed:@"5_167"] forState:UIControlStateNormal];
        [_picImage_1 addTarget:self action:@selector(p_picAPhoto:) forControlEvents:UIControlEventTouchUpInside];
        for (UIButton *btn in @[_picImage_2,_picImage_3])
        {
            [btn addTarget:self action:@selector(p_picAPhoto:) forControlEvents:UIControlEventTouchUpInside];
            [btn setImage:[UIImage imageNamed:@"5_167"] forState:UIControlStateNormal];
        }
        _publish=[[UIButton alloc]init];
        [_publish setImage:[UIImage imageNamed:@"5_175"] forState:UIControlStateNormal];
        [_publish addTarget:self action:@selector(p_doneAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=UIColor.whiteColor;
    [self.view sd_addSubviews:@[_textArea,_picImage_1,_publish,_picImage_2,_picImage_3,_ktitle]];
    //
    _textArea.sd_layout
    .leftSpaceToView(self.view, 20*LZGWIDTH)
    .topSpaceToView(self.backBtn, 10*LZGHEIGHT)
    .rightSpaceToView(self.view, 20*LZGWIDTH)
    .heightIs(300*LZGHEIGHT);
    //
    [_textArea sd_addSubviews:@[_textViewPlaceHolderLabel]];
    _textViewPlaceHolderLabel.sd_layout
    .leftEqualToView(_textViewPlaceHolderLabel)
    .topEqualToView(_textViewPlaceHolderLabel)
    .widthIs(100*LZGWIDTH)
    .heightIs(20*LZGHEIGHT);
    //
    _picImage_1.sd_layout
    .rightEqualToView(_textArea)
    .topSpaceToView(_textArea, 30*LZGHEIGHT)
    .widthIs(50*LZGWIDTH)
    .heightIs(50*LZGHEIGHT);
    //
    _publish.sd_layout
    .leftSpaceToView(self.view, 20*LZGWIDTH)
    .rightSpaceToView(self.view, 20*LZGWIDTH)
    .bottomSpaceToView(self.view, 50*LZGHEIGHT)
    .heightIs(20*LZGHEIGHT);
    //
    _picImage_2.sd_layout.centerYEqualToView(_picImage_1)
    .rightSpaceToView(_picImage_1, 20*LZGWIDTH)
    .heightRatioToView(_picImage_1, 1)
    .widthRatioToView(_picImage_1, 1);
    //
    _picImage_3.sd_layout
    .rightSpaceToView(_picImage_2, 10*LZGWIDTH)
    .centerYEqualToView(_picImage_1)
    .widthRatioToView(_picImage_1, 1)
    .heightRatioToView(_picImage_1, 1);
    //
    _ktitle.sd_layout
    .centerXEqualToView(self.view)
    .bottomSpaceToView(_publish, 30*LZGHEIGHT)
    .heightIs(40*LZGHEIGHT)
    .leftSpaceToView(self.view, 20*LZGWIDTH)
    .rightSpaceToView(self.view, 20*LZGWIDTH);
    _ktitle.backgroundColor=[UIColor colorWithRed:247/255.0 green:246/255.0 blue:251/255.0 alpha:1];
    
    // Do any additional setup after loading the view.
}
-(void)p_picAPhoto:(UIButton *)sender
{
    _selecBtn=sender;
    UIImagePickerController *picVc=[[UIImagePickerController alloc]init];
    [self presentViewController:picVc animated:YES completion:^{
        
    }];
    picVc.delegate=self;
}
-(void)p_doneAction:(UIButton *)sender
{
    
    
    if (!_textArea.text||[_textArea.text isEqualToString:@""]||[_textArea.text isEqualToString:@"say somthing!"]||!_ktitle.text||[_ktitle.text isEqualToString:@""])
    {
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"invalid input" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:alert animated:YES completion:^{
                   sleep(1);
    [alert dismissViewControllerAnimated:YES completion:nil];
               }];
    }
    else
    {
        NSDateFormatter *formate=[[NSDateFormatter alloc]init];
        formate.dateFormat=@"dd-MM-YY";
        NSString *localizeDate=[formate stringFromDate:[NSDate date]];
        [[NSNotificationCenter defaultCenter] postNotificationName:LzgReleaseViewControllerNotificationName object:nil userInfo:@{
            @"articleTitle":_ktitle.text,
            @"Date":[NSString stringWithFormat:@"update %@",localizeDate],
            @"image_1":_picImage_1.imageView.image,
            @"image_2":_picImage_2.imageView.image,
            @"image_3":_picImage_3.imageView.image,
            @"content":_textArea.text
        }];
        [self.navigationController popViewControllerAnimated:YES];
    }
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey, id> *)info
{
    __weak typeof(self) weakSelf=self;
    UIImage *getedImage=[info objectForKey:UIImagePickerControllerOriginalImage];
    if (getedImage)
    {
        [self dismissViewControllerAnimated:YES completion:^{
            [weakSelf.selecBtn setImage:getedImage forState:UIControlStateNormal];
        }];
    }
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    [_textViewPlaceHolderLabel removeFromSuperview];
    return YES;
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
