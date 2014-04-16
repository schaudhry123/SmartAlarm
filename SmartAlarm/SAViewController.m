//
//  SAViewController.m
//  SmartAlarm
//
//  Created by Samir on 4/13/14.
//  Copyright (c) 2014 SamirC. All rights reserved.
//

#import "SAViewController.h"

@interface SAViewController ()

- (IBAction)buttonPressed:(id)sender;

@end

@implementation SAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    datePicker.date = NSDate.date;
}

- (IBAction)setAlarm:(id)sender
{
    NSDate *alarmTime = datePicker.date;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.timeStyle = NSDateFormatterShortStyle;
    formatter.dateStyle = NSDateFormatterShortStyle;
    
    NSString *alarmTimeString = [formatter stringFromDate:alarmTime];
    NSLog(@"Alarm set: %@", alarmTimeString);
    
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    notification.fireDate = alarmTime;
    notification.timeZone = [NSTimeZone defaultTimeZone];
    notification.alertBody = @"Time to wake up!";
    notification.alertAction = @"Wake up";
    notification.soundName = @"alarm.wav";
    
    NSLog(@"The alarm is set for %@", alarmTime);
    
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(id)sender {
    
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    
    localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:10];
    
    localNotification.alertBody = @"Button Pressed!";

    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    
    NSLog(@"Done with this ");
}
@end
