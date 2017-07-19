//
//  Users+CoreDataProperties.m
//  SMS
//
//  Created by Dev on 7/19/17.
//  Copyright © 2017 Dev. All rights reserved.
//

#import "Users+CoreDataProperties.h"

@implementation Users (CoreDataProperties)

+ (NSFetchRequest<Users *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Users"];
}

@dynamic name;
@dynamic email;
@dynamic phonenumber;

@end
