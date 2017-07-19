//
//  NewUsersViewController.m
//  SMS
//
//  Created by Dev on 7/19/17.
//  Copyright © 2017 Dev. All rights reserved.
//

#import "NewUsersViewController.h"
#import "DBManager.h"

@interface NewUsersViewController ()

@end

@implementation NewUsersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)onSave:(id)sender {

    if ([self.txtName.text isEqual:@""] || [self.txtPhoneNumber.text isEqual:@""] || [self.txtEmail.text isEqual:@""]) {
        [self showDefaultAlert:@"Error" message:@"Input all fields"];
        return;
    }
    
    if (![self validateEmail:self.txtEmail.text]) {
        [self showDefaultAlert:@"Error" message:@"Invalid Email"];
        return;
    }

    if ([[DBManager sharedInstance] addUser:self.txtName.text phone:self.txtPhoneNumber.text email:self.txtEmail.text]) {
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        [self showDefaultAlert:@"Error" message:@"Failed adding a new user"];
    }
    
}

#pragma mark - validate email
- (BOOL) validateEmail: (NSString *) candidate {
    
    if([[candidate stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet] ] length] == 0)
        return YES;
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:candidate];
}

-(void) showDefaultAlert:(NSString*)title message:(NSString*)message
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    [alertController addAction:okAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}



@end
