//
//  DBManager.m
//  SMS
//
//  Created by Dev on 7/19/17.
//  Copyright © 2017 Dev. All rights reserved.
//

#import "DBManager.h"
#import "AppDelegate.h"

@implementation DBManager
@synthesize context;

+(instancetype) sharedInstance
{
    static DBManager *singleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleton = [[DBManager alloc] init];
    });
    
    return singleton;
}

-(id) init
{
    self = [super init];
    if (self) {
        AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        context = [appDelegate managedObjectContext];
    }
    
    return self;
}


-(NSArray*) getAllUsers
{
    NSFetchRequest *fetchRequest = [Users fetchRequest];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    NSError *error;
    NSArray *arrUsers = [context executeFetchRequest:fetchRequest error:&error];
    
    if (error) {
        return [[NSArray alloc] init];
    }
    
    return arrUsers;
}

-(BOOL) addUser:(NSString *)name phone:(NSString *)phonenumber email:(NSString *)email
{
    Users *users = [NSEntityDescription insertNewObjectForEntityForName:@"Users" inManagedObjectContext:context];
    
    users.name = name;
    users.email = email;
    users.phonenumber = phonenumber;
    
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"Error saving database");
        return NO;
    }
    
    return YES;
}

@end
