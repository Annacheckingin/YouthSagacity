//
//  Pictures+CoreDataProperties.h
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/4.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//
//

#import "Pictures+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Pictures (CoreDataProperties)

+ (NSFetchRequest<Pictures *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *urlSource;
@property (nullable, nonatomic, retain) NSData *img;

@end

NS_ASSUME_NONNULL_END
