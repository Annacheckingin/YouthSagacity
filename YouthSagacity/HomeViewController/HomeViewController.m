//
//  HomeViewController.m
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/1.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeViewControllerCollectionVIewCell.h"
#import "LzgSandBoxStore.h"
#import "UIButton+LzgBelongtoCell.h"
#import "HomeViewControllerTableViewCell.h"
#import "LzgDetailsViewController.h"
#import "LzgLabel.h"
#import "LzgTableView.h"
#import "LzgReleaseViewController.h"
#import "LzgReportViewController.h"
#define kBackGroundColor  [UIColor colorWithRed:247/255.0 green:246/255.0 blue:251/255.0 alpha:1]
@interface HomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegateFlowLayout,HomeViewControllerCollectionVIewCellDelegate,HomeViewControllerTableViewCellDelegate,UIScrollViewDelegate>
@property(nonatomic,strong)NSMutableArray *collectionViewCellInfor;
@property(nonatomic,strong)NSMutableArray *tableViewCellInfor;
@property(nonatomic,assign) BOOL freshedData;
@end

@implementation HomeViewController
-(void)viewWillAppear:(BOOL)animated
{
//    NSLog(@"%s",sel_getName(_cmd));
    self.navigationController.navigationBar.hidden=YES;
    if (_freshedData)
    {
        [self kHomeViewControllerShowData];
    }
    
}
-(void)kHomeViewControllerShowData
{
  
    NSString *stringOFdocumentPath=[[LzgSandBoxStore shareInstance] stringForSandBoxOfDocument];
    NSString *stringOfPlistFile=[stringOFdocumentPath stringByAppendingString:@"/FixedData.plist"];
    //
    NSMutableDictionary *dictotalData=[[NSMutableDictionary alloc]initWithContentsOfFile:stringOfPlistFile];
    NSMutableDictionary *HomeVc=dictotalData[@"HomeViewController"];
    NSMutableArray *collectionViewData=[NSMutableArray arrayWithArray:HomeVc[@"homeCollectionVIewCell"]];
    _collectionViewCellInfor=collectionViewData;
    //
    NSMutableArray *tableViewData=[NSMutableArray arrayWithArray:HomeVc[@"homeTableView"]];
    
    _tableViewCellInfor=tableViewData;
//    NSLog(@"%@",NSStringFromClass([NSArray class]));
//    NSLog(@"%@",NSStringFromClass([NSMutableArray class]));
//    if ([_collectionViewCellInfor isKindOfClass:[NSMutableArray class]])
//    {
//          NSLog(@"-----%s:%@",sel_getName(_cmd),NSStringFromClass([_collectionViewCellInfor class]));
//    }
  
    [self.tips reloadData];
    [self.projects reloadData];
    _freshedData=NO;
}
-(instancetype)init
{
    if (self=[super init])
    {
        self.baseScroView.delegate=self;
//        _freshedData=YES;
        _headLine=[[UILabel alloc]init];
        _headLine.text=@"BeadWork";
        _headLine.font=[UIFont fontWithName:@"CourierNewPS-BoldMT" size:15];
        _goForPublish=[[UIButton alloc]init];
        [_goForPublish addTarget:self action:@selector(p_punlishContent:) forControlEvents:UIControlEventTouchUpInside];
        [_goForPublish setImage:[UIImage imageNamed:@"realgofor"] forState:UIControlStateNormal];
        _goForPublish.imageView.contentMode=UIViewContentModeScaleAspectFill;
        _tipsLabel=[[UILabel alloc]init];
        _tipsLabel.text=@"BeadWork Tips";
        _tipsLabel.font=[UIFont fontWithName:@"Courier" size:12];
        //
        
#pragma mark CollectionView
         UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
        flowLayout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
        flowLayout.minimumInteritemSpacing=10*LZGWIDTH;
        flowLayout.sectionInset=UIEdgeInsetsMake(5, 10, 5, 10);
        flowLayout.itemSize=CGSizeMake(190*LZGHEIGHT, 180*LZGHEIGHT);
        _tips=[[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _tips.backgroundColor=UIColor.clearColor;
        _tips.showsHorizontalScrollIndicator=NO;
        [self.tips registerClass:[HomeViewControllerCollectionVIewCell class] forCellWithReuseIdentifier:NSStringFromClass([HomeViewControllerCollectionVIewCell class])];
        _tips.delegate=self;
        _tips.dataSource=self;
        //
        _projectsLabel=[[UILabel alloc]init];
        _projectsLabel.text=@"Beginner project works";
        _projectsLabel.font=_tipsLabel.font;
#pragma mark TableView
        _projects=[[LzgTableView alloc]init];
        _projects.backgroundColor=UIColor.clearColor;
        _projects.delegate=self;
        _projects.dataSource=self;
        _projects.separatorStyle=UITableViewCellSeparatorStyleNone;
      
    }
    return self;
}
-(void)p_punlishContent:(UIButton *)sender
{
    LzgReleaseViewController *rvc=[[LzgReleaseViewController alloc]init];
    [self.navigationController pushViewController:rvc animated:YES];
}
- (void)viewDidLoad
{
    _freshedData=YES;
    [super viewDidLoad];
    self.view.backgroundColor=kBackGroundColor;
    [self.baseScroView sd_addSubviews:@[_headLine,_goForPublish ,_tipsLabel,_tips,_projectsLabel,_projects]];
//    [self setTheScroViewContentSize:CGSizeMake(SCREENWIDTH, SCREENHEIGHT*1.2)];
    static float accumulateHeight=0;
    _headLine
    .sd_layout
#pragma mark 上方间隔
    .leftSpaceToView(self.baseScroView,  20*LZGWIDTH)
    .topSpaceToView(self.baseScroView, 40*LZGHEIGHT)
    .widthIs(80*LZGWIDTH)
#pragma mark 高度
    .heightIs(30*LZGHEIGHT);
    accumulateHeight+=70;
    //
     
    _goForPublish
    .sd_layout.leftEqualToView(_headLine)
#pragma mark 上方间隔
    .topSpaceToView(_headLine, 10*LZGHEIGHT)
    .rightSpaceToView(self.baseScroView, 20*LZGWIDTH)
#pragma mark 高度
    .heightIs(40*LZGHEIGHT);
    //
    accumulateHeight+=50;
    //
    _tipsLabel.sd_layout
     .leftEqualToView( _headLine)
#pragma mark 上方间隔
    .topSpaceToView(_goForPublish, 10*LZGHEIGHT)
#pragma mark 高度
    .heightIs(15);
    accumulateHeight+=25;
    [_tipsLabel setSingleLineAutoResizeWithMaxWidth:100];
#pragma mark CollectionnView布局
    //
    _tips.sd_layout
    .leftEqualToView(_headLine)
    .rightSpaceToView(self.baseScroView, 20*LZGWIDTH)
#pragma mark 上方间隔
    .topSpaceToView(_tipsLabel, 10*LZGHEIGHT)
#pragma mark 高度
    .heightIs(200*LZGHEIGHT);
    accumulateHeight+=210;
    //
    _projectsLabel.sd_layout
    .leftEqualToView(_headLine)
#pragma mark 上方间隔
    .topSpaceToView(_tips, 20*LZGHEIGHT)
#pragma mark 高度
    .heightIs(15*LZGHEIGHT);
    accumulateHeight+=35;
    [_projectsLabel setSingleLineAutoResizeWithMaxWidth:200];
    //

    //
    CGFloat heightOfTableView=250.0;
    accumulateHeight+=heightOfTableView+5;
    if (accumulateHeight<SCREENHEIGHT)
       {
           
           accumulateHeight=SCREENHEIGHT;
       }
    //
    [self setTheScroViewContentSize:CGSizeMake(SCREENWIDTH, accumulateHeight)];
    
    //
#pragma mark UItableView布局
     _projects.sd_layout.
     topSpaceToView(_projectsLabel, 5*LZGHEIGHT)
    .leftEqualToView(self.baseScroView)
    .rightEqualToView(self.baseScroView)
    .heightIs(heightOfTableView*LZGHEIGHT);
     
    // Do any additional setup after loading the view.
}
#pragma UIscrollViewDelegete

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
//    NSLog(@"%s",sel_getName(_cmd));
    if (_projects.contentOffset.y==0||_projects.contentOffset.y==_projects.bounds.size.height)
    {
        _projects.LzgAllowToSlide=NO;
    }
    else
    {
        _projects.LzgAllowToSlide=YES;
    }
    
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint currentPoint=scrollView.contentOffset;
    if (_projects.LzgAllowToSlide)
    {
        scrollView.contentOffset=currentPoint;
    }
    else
    {
        CGPoint currentPointOfTableview=_projects.contentOffset;
        _projects.contentOffset=currentPointOfTableview;
    }
//    static int i;
//    NSLog(@"%d--%s",i,sel_getName(_cmd));
//    i++;
}
#pragma mark UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     NSDictionary *dictionary=[_tableViewCellInfor objectAtIndex:indexPath.section];
    LzgDetailsViewController *vc=[[LzgDetailsViewController alloc]init];
    vc.hanleUI = ^(UIImageView * _Nonnull portarit, UILabel * _Nonnull name, UILabel * _Nonnull date, UILabel * _Nonnull articleTitle, UILabel * _Nonnull content, UIImageView * _Nonnull contentImgae, UILabel * _Nonnull thumbNum, UIView * _Nonnull baseView)
    {
        articleTitle.text=dictionary[@"articleTitle"];
        content.text=dictionary[@"breifContent"];
        [contentImgae yy_setImageWithURL:dictionary[@"img"] placeholder:[UIImage imageNamed:@"bitmap"]];
        
        
             UIScrollView *base=(UIScrollView *)baseView;
                CGSize theScroViewContentSize=base.contentSize;
                NSString *theContent=dictionary[@"breifContent"];
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
                .leftEqualToView(portarit)
                .rightSpaceToView(baseView, 20*LZGWIDTH)
                .topSpaceToView(articleTitle, 10*LZGHEIGHT);
                 content.text=[dictionary objectForKey:@"breifContent"];
                 //
                base.contentSize=theScroViewContentSize;
    };
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark UITableViewDatasource
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeViewControllerTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([HomeViewControllerTableViewCell class])];
    if (cell==nil)
    {
        cell=[[HomeViewControllerTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([HomeViewControllerTableViewCell class])];
    }
    
    NSDictionary *dictionary=[_tableViewCellInfor objectAtIndex:indexPath.section];
    cell.delegate=self;
    cell.cellTitle.text=dictionary[@"articleTitle"];
    cell.cellBriefContent.text=dictionary[@"breifContent"];
    [cell setTheCellDisplayImage:dictionary[@"img"]];
    cell.chatBtn.belongto=cell;
    cell.detailBtn.belongto=cell;
//   
 
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _tableViewCellInfor.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView cellHeightForIndexPath:indexPath cellContentViewWidth:SCREENWIDTH tableView:tableView];
}

//
#pragma mark UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"collectionViewCell selected");
     NSDictionary *inforDic=[self.collectionViewCellInfor objectAtIndex:indexPath.row];
    LzgDetailsViewController *detailsVc=[[LzgDetailsViewController alloc]init];
    detailsVc.hanleUI = ^(UIImageView * _Nonnull portarit, UILabel * _Nonnull name, UILabel * _Nonnull date, UILabel * _Nonnull articleTitle, UILabel * _Nonnull content, UIImageView * _Nonnull contentImgae, UILabel * _Nonnull thumbNum,UIView *baseView)
    {
        /*
         cell.cellTitle.textColor=UIColor.blackColor;
         cell.cellDate.text=inforDic[@"date"];
         cell.cellTitle.text=[inforDic objectForKey:@"articleTitle"];
         [cell.cellImage yy_setImageWithURL:inforDic[@"image"] placeholder:[UIImage imageNamed:@"bitmap"]];
         cell.cellAuthor.text=inforDic[@"author"];
         **/
        [portarit yy_setImageWithURL:inforDic[@"potrait"] placeholder:[UIImage imageNamed:@"bitmap"]];
        //
        name.text=inforDic[@"author"];
        date.text=inforDic[@"date"];
        articleTitle.text=[inforDic objectForKey:@"articleTitle"];
       
        [contentImgae  yy_setImageWithURL:inforDic[@"image"] placeholder:[UIImage imageNamed:@"bitmap"]];
#pragma mark 针对内容进行高度自适应
        UIScrollView *base=(UIScrollView *)baseView;
        CGSize theScroViewContentSize=base.contentSize;
        NSString *theContent=inforDic[@"content"];
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
        .leftEqualToView(portarit)
        .rightSpaceToView(baseView, 20*LZGWIDTH)
        .topSpaceToView(articleTitle, 10*LZGHEIGHT);
         content.text=[inforDic objectForKey:@"content"];
         //
        base.contentSize=theScroViewContentSize;
        
    };
    [self.navigationController pushViewController:detailsVc animated:YES];
}
#pragma mark UICollectionViewDatasource
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HomeViewControllerCollectionVIewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([HomeViewControllerCollectionVIewCell class]) forIndexPath:indexPath];
    NSDictionary *inforDic=[self.collectionViewCellInfor objectAtIndex:indexPath.row];
    cell.delegate=self;
    cell.cellDate.text=inforDic[@"date"];
    cell.cellTitle.text=[inforDic objectForKey:@"articleTitle"];
    [cell.cellImage yy_setImageWithURL:inforDic[@"image"] placeholder:[UIImage imageNamed:@"bitmap"]];
    cell.cellAuthor.text=inforDic[@"author"];
    cell.forbidBtn.belongto=cell;
    cell.warnningBtn.belongto=cell;
    return cell;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
//    NSLog(@"---%s%@",sel_getName(_cmd),NSStringFromClass([_collectionViewCellInfor class]));
    return _collectionViewCellInfor.count;
}
#pragma mark UICollectionViewFowLayoutDelegate
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    return CGSizeMake(100*LZGWIDTH, 100*LZGHEIGHT);
//}


- (void)HomeViewControllerCollectionVIewCellForBideTargetActionMethod:(nonnull UIButton *)sender
{
    
    UICollectionViewCell *belongtoCell=sender.belongto;
    [_collectionViewCellInfor removeObjectAtIndex:[_tips indexPathForCell:belongtoCell].row];
    NSIndexPath *indexPath=[NSIndexPath indexPathForRow:[_tips indexPathForCell:belongtoCell].row inSection:0];
    [_tips deleteItemsAtIndexPaths:@[indexPath]];
    
    
    
}

- (void)HomeViewControllerCollectionVIewCellWarningTargetActionMethod:(nonnull UIButton *)sender
{
    LzgReportViewController *rpVc=[[LzgReportViewController alloc]init];
    [rpVc.navigationController.navigationBar setHidden:NO];
    [self.navigationController pushViewController:rpVc animated:YES];
}
//
- (void)HomeViewControllerCollectionVIewCellViewDetailsTargetActionMethod:(nonnull UIButton *)sender
{
    UICollectionViewCell *belongtoCell=sender.belongto;
    NSIndexPath *indexPath=[_tips indexPathForCell:belongtoCell];
    [self collectionView:_tips didSelectItemAtIndexPath:indexPath];
}




//
- (void)HomeViewControllerTableViewCellTheTargetActionMethodOfChatBtn:(nonnull UIButton *)sender
{
   
}

- (void)HomeViewControllerTableViewCellTheTargetActionMethodOfDetailBtn:(nonnull UIButton *)sender
{
     UITableViewCell *cell=sender.belongto;
    NSIndexPath *indexpath=[_projects indexPathForCell:cell];
    [self tableView:_projects didSelectRowAtIndexPath:indexpath];
}

 


@end
