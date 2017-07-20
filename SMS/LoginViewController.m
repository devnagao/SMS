//
//  LoginViewController.m
//  SMS
//
//  Created by Dev on 7/20/17.
//  Copyright © 2017 Dev. All rights reserved.
//

#import "LoginViewController.h"
#import "UsersViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onLogin:(id)sender {
    
    if ([self.txtEmail.text isEqual:@"shoprofy@gmail.com"]) {
        
        UsersViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"UsersViewController"];
        [self.navigationController pushViewController:vc animated:YES];
        
    }
    
    
}
@end
