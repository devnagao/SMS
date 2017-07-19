//
//  ViewController.m
//  SMS
//
//  Created by Dev on 7/19/17.
//  Copyright © 2017 Dev. All rights reserved.
//

#import "ViewController.h"
#import "UsersTableViewCell.h"

#import "DBManager.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize arrUsers;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
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

@end
