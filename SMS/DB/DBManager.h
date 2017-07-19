//
//  DBManager.h
//  SMS
//
//  Created by Dev on 7/19/17.
//  Copyright © 2017 Dev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#import "Users+CoreDataClass.h"

@interface DBManager : NSObject

@property (nonatomic, strong) NSManagedObjectContext *context;

+(instancetype) sharedInstance;

-(NSArray*) getAllUsers;
-(BOOL) addUser:(NSString*)name phone:(NSString*)phonenumber email:(NSString*)email;

@end
