//
//  SAViewController.m
//  SmartAlarm
//
//  Created by Samir on 4/13/14.
//  Copyright (c) 2014 SamirC. All rights reserved.
//

#import "SAViewController.h"

@interface SAViewController ()

@end

@implementation SAViewController

@synthesize question;
@synthesize answer1;
@synthesize answer2;
@synthesize answer3;
@synthesize answer4;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationController.navigationBar.hidden = YES;
    //Set to current date
    datePicker.date = NSDate.date;
    
    
    //Generate the question with two random numbers from 1 to 50
    number1 = (arc4random()%50+1); //Generates random number from 1 to 50
    number2 = (arc4random()%50+1);
    NSString *string = [NSString stringWithFormat:@"%i + %i", number1, number2];
    question.text = string;
    
    
    //Generate the answer
    NSString *answer = [NSString stringWithFormat:@"%i",number1 + number2];
    
    NSString *ans1 = [NSString stringWithFormat:@"%i", (arc4random()%100+1)];
    [answer1 setTitle:ans1 forState:UIControlStateNormal];
    
    NSString *ans2 = [NSString stringWithFormat:@"%i", (arc4random()%100+1)];
    [answer2 setTitle:ans2 forState:UIControlStateNormal];
    
    NSString *ans3 = [NSString stringWithFormat:@"%i", (arc4random()%100+1)];
    [answer3 setTitle:ans3 forState:UIControlStateNormal];
    
    NSString *ans4 = [NSString stringWithFormat:@"%i", (arc4random()%100+1)];
    [answer4 setTitle:ans4 forState:UIControlStateNormal];
    
    //Random number from 1 to 4
    int ansNum = (arc4random()%4+1);
    
    if (ansNum == 1) {
        [answer1 setTitle:answer forState:UIControlStateNormal];
    }
    else if (ansNum == 2) {
        [answer2 setTitle:answer forState:UIControlStateNormal];
    }
    else if (ansNum == 3) {
        [answer3 setTitle:answer forState:UIControlStateNormal];
    }
    else {
        [answer4 setTitle:answer forState:UIControlStateNormal];
    }
}

- (IBAction)answerPressed:(UIButton *)sender
{
    NSString *answer = [NSString stringWithFormat:@"%i",number1 + number2];
    
    if ([sender.titleLabel.text isEqualToString:answer]) {
        [[UIApplication sharedApplication] cancelAllLocalNotifications];
        NSLog(@"Right answer selected");
        self.navigationController.navigationBarHidden = NO;
        [super viewDidLoad];
    }
    NSLog(@"The button title is %@", sender.titleLabel.text);
}

- (IBAction)setAlarm:(id)sender
{
    NSDate *alarmTime = datePicker.date;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.timeStyle = NSDateFormatterShortStyle;
    formatter.dateStyle = NSDateFormatterShortStyle;
    
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    notification.fireDate = alarmTime;
    notification.timeZone = [NSTimeZone defaultTimeZone];
    notification.alertBody = @"Time to wake up!";
    notification.alertAction = @"Wake up";
    //notification.soundName = @"alarm.wav";
    notification.soundName = @"alarm.mp3";
    
    NSLog(@"The alarm is set for %@", alarmTime);
    
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
