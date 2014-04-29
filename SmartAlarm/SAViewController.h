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
    int number1;
    int number2;
//    IBOutlet UILabel *question;
//    IBOutlet UIButton *answer1;
//    IBOutlet UIButton *answer2;
//    IBOutlet UIButton *answer3;
//    IBOutlet UIButton *answer4;
}

@property (weak, nonatomic) IBOutlet UILabel *question;
@property (weak, nonatomic) IBOutlet UIButton *answer1;
@property (weak, nonatomic) IBOutlet UIButton *answer2;
@property (weak, nonatomic) IBOutlet UIButton *answer3;
@property (weak, nonatomic) IBOutlet UIButton *answer4;


- (IBAction)setAlarm:(id)sender;
- (IBAction)generateQuestion;
- (IBAction)generateAnswers;

@end