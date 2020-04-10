//
//  NewsViewController.m
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/1.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "NewsViewController.h"
#import "NewsTableViewCell.h"
#import "LzgImageCollectionCell.h"
#import "LzgSandBoxStore.h"
#import "LzgLabel.h"
#import "UIButton+LzgBelongtoCell.h"
#import "NewsDetailViewController.h"
#define kLzgTopCollectionViewHeight 150
#define kBackGroundColor  [UIColor colorWithRed:247/255.0 green:246/255.0 blue:251/255.0 alpha:1]
@interface NewsViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource,NewsTableViewCellButtonDelegate>
@property(nonatomic,strong)NSMutableArray *headImages;
@property(nonatomic,strong)NSMutableArray *tableViewData;
@property(nonatomic,assign)BOOL kfreshed;
@property(nonatomic,strong)UICollectionView *topShow;
@property(nonatomic,strong)UITableView *mainDisplay;
@end

@implementation NewsViewController
-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden=YES;

    if (_kfreshed)
    {
        [self kRefreshData];
    }
}
-(void)kRefreshData
{
   
    NSString *pathOfDocumentDirectory=[[LzgSandBoxStore shareInstance] stringForSandBoxOfDocument];
    NSString *nameOfPlistFile=[pathOfDocumentDirectory stringByAppendingString:@"/FixedData.plist"];
    NSDictionary *dicOfNewsData=[NSDictionary dictionaryWithContentsOfFile:nameOfPlistFile];
    
    _tableViewData=dicOfNewsData[@"NewsViewController"][@"NewsTableViewCell"];
    _kfreshed=NO;
}
-(instancetype)init
{
    if(self=[super init])
    {
        _kfreshed=YES;
        _headImages=[NSMutableArray arrayWithObjects:[UIImage imageNamed:@"5_71"],[UIImage imageNamed:@"5_73"],[UIImage imageNamed:@"5_115"], nil];
        UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
//        flowLayout.minimumLineSpacing=-((SCREENWIDTH-2*40*LZGWIDTH)/2-(SCREENWIDTH-2*40*LZGWIDTH)*0.8*0.2);
        flowLayout.minimumLineSpacing=20*LZGWIDTH;
        flowLayout.sectionInset=UIEdgeInsetsMake(0, 20*LZGWIDTH, 0, 20*LZGWIDTH);
        flowLayout.itemSize=CGSizeMake(SCREENWIDTH-40*LZGWIDTH, kLzgTopCollectionViewHeight*LZGHEIGHT);
        flowLayout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
        _topShow=[[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        [_topShow registerClass:[LzgImageCollectionCell class] forCellWithReuseIdentifier:NSStringFromClass([LzgImageCollectionCell class])];
//        [_topShow setCollectionViewLayout:flowLayout];
        _topShow.delegate=self;
        _topShow.dataSource=self;
        _topShow.backgroundColor=UIColor.clearColor;
        _mainDisplay=[[UITableView alloc]init];
        _mainDisplay.delegate=self;
        _mainDisplay.dataSource=self;
        _mainDisplay.separatorStyle=UITableViewCellSeparatorStyleNone;
        _mainDisplay.backgroundColor=UIColor.clearColor;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.baseScroView.backgroundColor=kBackGroundColor;
    [self setTheScroViewContentSize:CGSizeMake(SCREENWIDTH, SCREENHEIGHT)];
    [self.baseScroView addSubview:_topShow];
    [self.baseScroView addSubview:_mainDisplay];
    [self p_setUpUI];

    // Do any additional setup after loading the view.
}
-(void)p_setUpUI
{
    _topShow.sd_layout
    .leftEqualToView(self.baseScroView)
    .rightEqualToView(self.baseScroView)
    .topEqualToView(self.baseScroView).offset(10*LZGHEIGHT)
    .heightIs(kLzgTopCollectionViewHeight*LZGHEIGHT);
    //
     _mainDisplay.sd_layout
    .leftEqualToView(_topShow)
    .rightEqualToView(_topShow)
    .bottomEqualToView(self.baseScroView)
    .topSpaceToView(_topShow, 10*LZGHEIGHT);
    //
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark UIcollectionViewDelegate/datasource
- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    LzgImageCollectionCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([LzgImageCollectionCell class]) forIndexPath:indexPath];
    NSInteger indexOfImagesArray = 0;
    switch (indexPath.row) {
            case 0:
            indexOfImagesArray=indexPath.row;
            break;
            case 1:
            indexOfImagesArray=indexPath.row;
            break;
            case 2:
            indexOfImagesArray=indexPath.row;
            break;
    }
    
    UIImage *displayImage=_headImages[indexOfImagesArray];
    [cell.imageView setImage:displayImage];
    return cell;
    
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.headImages.count;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
#pragma mark UItableViewDelegate/datasource
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [_mainDisplay cellHeightForIndexPath:indexPath cellContentViewWidth:SCREENWIDTH tableView:_mainDisplay];
}
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    NewsTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([NewsTableViewCell class])];
    if (cell==nil)
    {
        cell=[[NewsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([NewsTableViewCell class])];
    }
    NSDictionary *curentData=[_tableViewData objectAtIndex:indexPath.section];
    cell.delegate=self;
    cell.blockingNews.belongto=cell;
    cell.likesBtn.belongto=cell;
    cell.biewDetailsBtn.belongto=cell;
    cell.cellTitle.text=curentData[@"articleTitle"];
    cell.cellBriefContent.text=curentData[@"content"];
    [cell.img_1 yy_setImageWithURL:curentData[@"image_1"] placeholder:[UIImage imageNamed:@"bitmap"]];
    [cell.img_2 yy_setImageWithURL:curentData[@"image_2"] placeholder:[UIImage imageNamed:@"bitmap"]];
    [cell.img_3 yy_setImageWithURL:curentData[@"image_3"] placeholder:[UIImage imageNamed:@"bitmap"]];
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     NSDictionary *curentData=[_tableViewData objectAtIndex:indexPath.section];
    NewsDetailViewController *vc=[[NewsDetailViewController alloc]init];
    vc.handleUi = ^(UILabel * _Nonnull title, LzgLabel * _Nonnull content, UIImageView * _Nonnull img_1, UIImageView * _Nonnull img_2, UIImageView * _Nonnull img_3,UIView *basementView,UIButton *blocking)
    {
        title.text=curentData[@"articleTitle"];
        content.text=curentData[@"content"];
        [img_1 yy_setImageWithURL:curentData[@"image_1"] placeholder:[UIImage imageNamed:@"bitmap"]];
        [img_2  yy_setImageWithURL:curentData[@"image_2"] placeholder:[UIImage imageNamed:@"bitmap"]];
        [img_3  yy_setImageWithURL:curentData[@"image_3"] placeholder:[UIImage imageNamed:@"bitmap"]];
        
        UIScrollView *base=(UIScrollView *)basementView;
                     CGSize theScroViewContentSize=base.contentSize;
                     NSString *theContent=curentData[@"content"];
             //        NSAttributedString *attributedContent=[[NSAttributedString alloc]initWithString:theContent];
             //        CGSize theStringSize=[attributedContent size];
                     
                     CGSize refenreceSize=CGSizeMake(SCREENWIDTH-40*LZGWIDTH, MAXFLOAT);
                     LzgLabel *templabel=[[LzgLabel alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH-40*LZGWIDTH,0)];
                     templabel.numberOfLines=0;
                     templabel.font=content.font;
                     templabel.textAlignment=NSTextAlignmentNatural;
                     templabel.text=theContent;
                     CGSize theStringSize=[templabel sizeThatFits:refenreceSize];
             #pragma mark 由于使用了自定义的Label，故计算的高度需要调整
             //        =[theContent boundingRectWithSize:CGSizeMake(SCREENWIDTH-20*LZGWIDTH, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:nil context:nil];
             //         CGSize  theSize=theStringRect.size;
                     
                     theScroViewContentSize.height+=theStringSize.height;
                     theScroViewContentSize.height+=200;
                     //
                     //
                      content.sd_resetLayout
                     .heightIs(theStringSize.height*LZGHEIGHT)
                     .leftEqualToView(title)
                     .rightSpaceToView(basementView, 20*LZGWIDTH)
                     .topSpaceToView(blocking, 5*LZGHEIGHT);
                      content.text=[curentData objectForKey:@"content"];
                      //
                     base.contentSize=theScroViewContentSize;
        
        
        
    };
    NSLog(@"ok");
    [self.navigationController pushViewController:vc animated:YES];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _tableViewData.count;
}







- (void)NewsTableViewCellBlockingTargetActionMethod:(nonnull UIButton *)sender {
    
}

- (void)NewsTableViewCellLikeButtonTargetActionMethod:(nonnull UIButton *)sender {
    
}

- (void)NewsTableViewCellViewDetailsTargetActionMethod:(nonnull UIButton *)sender {
    NewsTableViewCell *cell=sender.belongto;
    NSIndexPath *indexpath= [_mainDisplay indexPathForCell:cell];
    [self tableView:_mainDisplay didSelectRowAtIndexPath:indexpath];
   
}







@end
