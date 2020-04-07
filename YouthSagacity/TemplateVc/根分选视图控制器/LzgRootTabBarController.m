//
//  LzgRootTabBarController.m
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/1.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "LzgRootTabBarController.h"
static LzgRootTabBarController *LzgRootTabBarControllerme;
@interface LzgRootTabBarController ()

@end

@implementation LzgRootTabBarController
-(instancetype)init
{
    if (self=[super init])
    {
        
    }
    return self;
}
+(instancetype)shareInstance
{
    
    
  
    if (!LzgRootTabBarControllerme)
    {
        LzgRootTabBarControllerme=[[LzgRootTabBarController alloc]init];
    }
    return LzgRootTabBarControllerme;
}
+(instancetype)allocAndSetTheViewControllers:(NSArray <UIViewController *>*)viewControllers whitNavigationController:(BOOL)yesornot
{
    if (!LzgRootTabBarControllerme)
    {
        LzgRootTabBarControllerme=[LzgRootTabBarController shareInstance];
    }
//    NSLog(@"%@",LzgRootTabBarControllerme);
    NSMutableArray *mutableViewsController=[NSMutableArray array];
    //
    switch(yesornot)
    {
        case NO:
              LzgRootTabBarControllerme.viewControllers=viewControllers;
            break;
        default:
            for (UIViewController *vc in viewControllers)
            {
                UINavigationController *navi=[[UINavigationController alloc]initWithRootViewController:vc];
                [mutableViewsController addObject:navi];
            }
            LzgRootTabBarControllerme.viewControllers=mutableViewsController;
            break;
    }
  
    return LzgRootTabBarControllerme;
}
-(void)viewControllersSetTheTabBarItemImagesWithSequenceUnselectedBegin:(NSArray <UIImage *>*)images
{
    NSArray *viewControllers=self.viewControllers;
    NSInteger isTwo=images.count/viewControllers.count;
    if (isTwo!=2)
    {
        @throw [NSException exceptionWithName:@"wrong images count" reason:@"every tabbaritem needs two images for different status" userInfo:nil];
    }
    static NSInteger indexOfImages=0;
    for (UIViewController *vc in viewControllers)
    {
    
    vc.tabBarItem.image=images[indexOfImages*2];
    vc.tabBarItem.selectedImage=images[indexOfImages*2+1];
    //
    indexOfImages++;
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];

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
