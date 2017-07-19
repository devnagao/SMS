//
//  Users+CoreDataProperties.h
//  SMS
//
//  Created by Dev on 7/19/17.
//  Copyright © 2017 Dev. All rights reserved.
//

#import "Users+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Users (CoreDataProperties)

+ (NSFetchRequest<Users *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *email;
@property (nullable, nonatomic, copy) NSString *phonenumber;

@end

NS_ASSUME_NONNULL_END
