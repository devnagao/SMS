//
//  UsersViewController.h
//  SMS
//
//  Created by Dev on 7/19/17.
//  Copyright © 2017 Dev. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <MessageUI/MessageUI.h>

@interface UsersViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, MFMessageComposeViewControllerDelegate>

@property (nonatomic, strong) NSArray *arrUsers;
@property (nonatomic, strong) NSMutableArray *arrSelectedUsers;

@property (weak, nonatomic) IBOutlet UITableView *tableView;


- (IBAction)onAdd:(id)sender;
- (IBAction)onSignOut:(id)sender;

@end

