//
//  ViewController.m
//  SMS
//
//  Created by Dev on 7/19/17.
//  Copyright © 2017 Dev. All rights reserved.
//

#import "ViewController.h"
#import "UsersTableViewCell.h"
#import "NewUsersViewController.h"
#import "DBManager.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize arrUsers;
@synthesize arrSelectedUsers;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    arrUsers = [[NSArray alloc] init];
    arrSelectedUsers = [[NSMutableArray alloc] init];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    arrUsers = [[DBManager sharedInstance] getAllUsers];
    
    [self.tableView reloadData];
}

#pragma mark - MFMessageComposeViewController Delegate
-(void) messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    switch (result) {
        case MessageComposeResultCancelled:
            break;
            
        case MessageComposeResultFailed:
        {
            [self showDefaultAlert:@"Error" message:@"Failed to send SMS!"];
            break;
        }
            
        case MessageComposeResultSent:
            break;
            
        default:
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}



#pragma mark - tableview datasource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrUsers.count;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UsersTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UsersTableViewCell" forIndexPath:indexPath];
    
    NSInteger row = [indexPath row];
    
    Users *user = arrUsers[row];
    
    cell.lblName.text = user.name;
    cell.lblEmail.text = user.email;
    cell.lblPhone.text = user.phonenumber;
    
    return cell;
}


#pragma mark - tableview delegate

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = [indexPath row];
    Users *user = arrUsers[row];
    
    if ([tableView cellForRowAtIndexPath:indexPath].accessoryType == UITableViewCellAccessoryNone) {
        [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;
        [arrSelectedUsers addObject:user];
    } else if ([tableView cellForRowAtIndexPath:indexPath].accessoryType == UITableViewCellAccessoryCheckmark) {
        [tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryNone;
        [arrSelectedUsers removeObject:user];
    }
    
    if (arrSelectedUsers.count > 0) {
        [self.navigationItem.rightBarButtonItem setTitle:@"Send"];    
    } else {
        [self.navigationItem.rightBarButtonItem setTitle:@"Add"];
    }
    
}

-(void) showSMS
{
    if(![MFMessageComposeViewController canSendText]) {
        [self showDefaultAlert:@"Error" message:@"Your device doesn't support SMS!"];
        return;
    }
    
    NSMutableArray *recipents = [[NSMutableArray alloc] init];
    for (Users *user in arrSelectedUsers) {
        [recipents addObject:user.phonenumber];
    }
    
    NSString *message = @"";
    
    MFMessageComposeViewController *messageController = [[MFMessageComposeViewController alloc] init];
    messageController.messageComposeDelegate = self;
    [messageController setRecipients:recipents];
    [messageController setBody:message];
    
    // Present message view controller on screen
    [self presentViewController:messageController animated:YES completion:nil];
}



-(void) showDefaultAlert:(NSString*)title message:(NSString*)message
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:okAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (IBAction)onAdd:(id)sender {
    
    if (arrSelectedUsers.count > 0) {
        [self showSMS];
    } else {
        NewUsersViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"NewUsersViewController"];
        [self.navigationController pushViewController:vc animated:YES];
    }
}
@end
