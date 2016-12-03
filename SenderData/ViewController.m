//
//  ViewController.m
//  SenderData
//
//  Created by TJX on 12/3/16.
//  Copyright © 2016 TJX. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize greeting, nameInput, webData;
@synthesize passInput;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)buttonClick:(id)sender {
    NSString* username = nameInput.text; // Getting text from UITextField
    NSString* pass = passInput.text; // Getting text from UITextField
    if ([nameInput.text isEqualToString:@"" ] || [passInput.text isEqualToString:@""]) {
        greeting.text = @"Input Your Value";
        [nameInput resignFirstResponder];
        [passInput resignFirstResponder];
        return; }
}

@end
