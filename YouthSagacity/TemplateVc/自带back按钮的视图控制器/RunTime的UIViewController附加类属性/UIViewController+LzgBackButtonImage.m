//
//  UIViewController+LzgBackButtonImage.m
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/1.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//

#import "UIViewController+LzgBackButtonImage.h"



#import <objc/runtime.h>

@implementation UIViewController (LzgBackButtonImage)
const static char *theidentifier="LzgBackButtonImageIdentifier";
+(void)setTheBackButtonImage:(UIImage *)image
{
    objc_setAssociatedObject(self, theidentifier, image, OBJC_ASSOCIATION_RETAIN);
}
+(UIImage* )theBackButtonImage
{
  UIImage *img=objc_getAssociatedObject(self, theidentifier);
    return img;
}
@end
