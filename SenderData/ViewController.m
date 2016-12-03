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
    
    NSString *post=[[NSString alloc]  initWithFormat:@"uname=%@&pwd=%@",username,pass];
    NSData *postData=[post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *postLength = [NSString stringWithFormat:@"%lu",(unsigned long)[postData length]];
    NSURL *url = [NSURL URLWithString:@"http://www.cs.hku.hk/~c7506/login.php"];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setValue:postLength forHTTPHeaderField:@"Content-Length"]; [theRequest setHTTPBody:postData];
    NSURLConnection *theConnection
    = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if (theConnection) {
        webData = [[NSMutableData data] retain]; }
    else {
    }
    [nameInput resignFirstResponder];
    [passInput resignFirstResponder];
    nameInput.text = nil;
    passInput.text = nil;
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [webData setLength: 0]; // Called when there is any response from the server
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [webData appendData:data];
}// Called when there is any data from the server }

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
        [connection release]; // Called when there is any error
        [webData release]; }

-(void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSString *loginStatus = [[NSString alloc] initWithBytes: [webData mutableBytes] length:[webData length] encoding:NSUTF8StringEncoding];
    NSLog(loginStatus);
    // A debugging function like printf() in C. However, it also prints the process name and date before it prints the actual format and writes to sdterr.
    greeting.text = loginStatus; [loginStatus release];
    [connection release];
    [webData release]; }


@end
