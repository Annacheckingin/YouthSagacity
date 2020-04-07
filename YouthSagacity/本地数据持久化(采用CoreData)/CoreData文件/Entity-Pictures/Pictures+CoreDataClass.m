//
//  Pictures+CoreDataClass.m
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/4.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//
//

#import "Pictures+CoreDataClass.h"

@implementation Pictures
+(Pictures *)pictureWithUrlSource:(NSString *)urlSource andImage:(UIImage *)image
{
    Pictures *me=[[Pictures alloc]init];
    me.urlSource=urlSource;
    me.img=UIImagePNGRepresentation(image);
    return me;
}
-(instancetype)init
{
    if (self=[super init])
    {
        
    }
    return self;
}
@end
