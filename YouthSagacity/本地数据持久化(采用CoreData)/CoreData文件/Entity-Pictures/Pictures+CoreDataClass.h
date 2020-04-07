//
//  Pictures+CoreDataClass.h
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/4.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface Pictures : NSManagedObject
+(Pictures *)pictureWithUrlSource:(NSString *)urlSource andImage:(UIImage *)image;
@end

NS_ASSUME_NONNULL_END

#import "Pictures+CoreDataProperties.h"
