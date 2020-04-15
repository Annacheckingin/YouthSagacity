//
//  NewsDetailViewController.m
//  YouthSagacity
//
//  Created by LiZhengGuo on 2020/4/10.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "NewsDetailViewController.h"
#import "LzgLabel.h"
#import "UIButton+LzgButtonBelongToVc.h"
@interface NewsDetailViewController ()
@property(nonatomic,strong)UILabel *newsTitle;
@property(nonatomic,strong)UIButton *blockingBtn;
@property(nonatomic,strong)UIButton *likesBtn;
@property(nonatomic,strong)LzgLabel *content;
@property(nonatomic,strong)UIImageView *img_1;
@property(nonatomic,strong)UIImageView *img_2;
@property(nonatomic,strong)UIImageView *img_3;
@property(nonatomic,strong)UITableView *commentsTableView;
@end

@implementation NewsDetailViewController
-(UITableView *)commentsTableView
{
    if (_commentsTableView==nil)
    {
        _commentsTableView=[[UITableView alloc]init];
    }
    return _commentsTableView;
}
-(instancetype)init
{
    if (self=[super init])
    {
        _newsTitle=[[UILabel alloc]init];
        _newsTitle.font=[UIFont fontWithName:@"Georgia-Bold" size:11];
        _blockingBtn=[[UIButton alloc]init];
        _blockingBtn.belongToVc=self;
        _blockingBtn.imageView.contentMode=UIViewContentModeScaleAspectFit;
        [_blockingBtn setImage:[UIImage imageNamed:@"5_153"] forState:UIControlStateNormal];
        _likesBtn=[[UIButton alloc]init];
        _likesBtn.belongToVc=self;
        _likesBtn.imageView.contentMode=_blockingBtn.imageView.contentMode;
        [_likesBtn setImage:[UIImage imageNamed:@"5_161"] forState:UIControlStateNormal];
        [_likesBtn setImage:[UIImage imageNamed:@"5_156"] forState:UIControlStateSelected];
        _content=[[LzgLabel alloc]init];
        _content.numberOfLines=0;
        _img_1=[[UIImageView alloc]init];
        _img_2=[[UIImageView alloc]init];
        _img_3=[[UIImageView alloc]init];
        for (UIImageView *obj in @[_img_1,_img_2,_img_3])
        {
            obj.contentMode=UIViewContentModeScaleAspectFit;
        }
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated
{
    __weak UILabel *titile=_newsTitle;
    __weak LzgLabel *content=_content;
    __weak UIImageView *img1=_img_1;
    __weak UIImageView *img2=_img_2;
    __weak UIImageView *img3=_img_3;
    __weak UIScrollView *base=self.baseScroView;
    __weak UIButton *blo=_blockingBtn;
    if(self.handleUi){
    self.handleUi(titile, content, img1, img2, img3, base,blo);
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.baseScroView sd_addSubviews:@[_newsTitle,_blockingBtn,_likesBtn,_content,_img_1,_img_2,_img_3]];
    //
    _newsTitle.sd_layout
    .leftSpaceToView(self.baseScroView, 20*LZGWIDTH)
    .topSpaceToView(self.baseScroView, 40*LZGHEIGHT)
    .heightIs(15*LZGHEIGHT);
    [_newsTitle setSingleLineAutoResizeWithMaxWidth:SCREENWIDTH];
    //
    _blockingBtn.sd_layout
    .leftEqualToView(_newsTitle)
    .topSpaceToView(_newsTitle, 10*LZGHEIGHT)
    .heightIs(20*LZGHEIGHT)
    .widthIs(100*LZGWIDTH);
    //
    
    //
    _likesBtn.sd_layout
    .rightSpaceToView(self.baseScroView, 20*LZGWIDTH)
    .centerYEqualToView(_blockingBtn)
    .widthRatioToView(_blockingBtn, 1)
    .heightRatioToView(_blockingBtn, 1);
    //
    //
    
    _content.sd_layout
    .topSpaceToView(_blockingBtn, 5*LZGHEIGHT)
    .leftEqualToView(_blockingBtn)
    .rightEqualToView(_likesBtn)
    .heightIs(200);
    //
    CGFloat gapBetweenPics=10*LZGWIDTH;
    CGFloat theWidthOfPic=(SCREENWIDTH-2*gapBetweenPics-40*LZGWIDTH)/3;
    //
    _img_1.sd_layout
    .leftEqualToView(_content)
    .widthIs(theWidthOfPic)
    .heightEqualToWidth().offset(20*LZGHEIGHT)
    .topSpaceToView(_content, 10*LZGHEIGHT);
    //
    _img_2.sd_layout
    .centerYEqualToView(_img_1)
    .leftSpaceToView(_img_1, gapBetweenPics)
    .widthIs(theWidthOfPic)
    .heightRatioToView(_img_1, 1);
    //
    _img_3.sd_layout
    .centerYEqualToView(_img_2)
    .widthIs(theWidthOfPic)
    .heightRatioToView(_img_1, 1)
    .leftSpaceToView(_img_2, gapBetweenPics);
#pragma mark 测试
   
    // Do any additional setup after loading the view.
}
-(void)setDelegate:(id<NewsDetailViewControllerDelegate>)delegate
{
    _delegate=delegate;
    if ([_delegate conformsToProtocol:@protocol(NewsDetailViewControllerDelegate) ])
    {
        if ([_delegate respondsToSelector:@selector(NewsDetailViewControllerDelegateLikeAction:)])
        {
             [_likesBtn addTarget:_delegate action:@selector(NewsDetailViewControllerDelegateLikeAction:) forControlEvents:UIControlEventTouchUpInside];
        }
       if ([_delegate respondsToSelector:@selector(NewsDetailViewControllerDelegateBlockingAction:)])
       {
           [_blockingBtn addTarget:_delegate action:@selector(NewsDetailViewControllerDelegateBlockingAction:) forControlEvents:UIControlEventTouchUpInside];
       }
        
    }
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
