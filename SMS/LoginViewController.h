//
//  LoginViewController.h
//  SMS
//
//  Created by Dev on 7/20/17.
//  Copyright © 2017 Dev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *txtEmail;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;


- (IBAction)onLogin:(id)sender;


@end
