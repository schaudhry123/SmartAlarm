//
//  SAViewController.h
//  SmartAlarm
//
//  Created by Samir on 4/13/14.
//  Copyright (c) 2014 SamirC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SAViewController : UIViewController
{
    IBOutlet UIDatePicker *datePicker;
    IBOutlet UIButton *startButton;
}

- (IBAction)setAlarm:(id)sender;

@end