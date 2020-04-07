//
//  Pictures+CoreDataProperties.m
//  Youth Sagacity
//
//  Created by LiZhengGuo on 2020/4/4.
//  Copyright © 2020 LiZhengGuo. All rights reserved.
//
//

#import "Pictures+CoreDataProperties.h"

@implementation Pictures (CoreDataProperties)

+ (NSFetchRequest<Pictures *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Pictures"];
}
-(BOOL)isEqual:(id)object
{
    BOOL superequal=[super isEqual:object];
    if (!superequal)
    {
        return NO;
    }
    BOOL isThisClass=[object isMemberOfClass:[Pictures class]];
    if (!isThisClass)
    {
        return NO;
    }
    //
    Pictures *picPara=(Pictures *)object;
    if (![self.urlSource isEqualToString:picPara.urlSource])
    {
        return NO;
    }
    return YES;
    
}
@dynamic urlSource;
@dynamic img;

@end
