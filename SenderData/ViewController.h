//
//  ViewController.h
//  SenderData
//
//  Created by TJX on 12/3/16.
//  Copyright © 2016 TJX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate> {
    IBOutlet UILabel *greeting;

    IBOutlet UITextField *passInput;
    IBOutlet UITextField *nameInput;
    NSMutableData *webData;
}

@property(nonatomic, retain) IBOutlet UITextField *nameInput;
@property(nonatomic, retain) IBOutlet UITextField *passInput;
@property(nonatomic, retain) IBOutlet UILabel *greeting;
@property(nonatomic, retain) NSMutableData *webData;

- (IBAction)buttonClick:(id)sender;

@end

