//
//  ViewController.m
//  ButtonPersistence
//
//  Created by Maximilian Tagher on 12/2/12.
//  Copyright (c) 2012 Max. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    UISwitch *onOffSwitch = [[UISwitch alloc] init];
    
    // If it is the first time were are running this code, we will get nil from `NSUserDefaults`, and we'll turn the switch off.
    // After the user has set the switch, it will store the value in NSUserDefaults and we can remember what to set it to the next time viewDidLoad is called.
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"SwitchKey"]) {
        [onOffSwitch setOn:YES animated:NO];
    } else {
        [onOffSwitch setOn:NO animated:NO];
    }
    
    [onOffSwitch sizeToFit];
    onOffSwitch.center = CGPointMake(CGRectGetMidX(self.view.frame), CGRectGetMidY(self.view.frame));
    [self.view addSubview:onOffSwitch];
    
    [onOffSwitch addTarget:self action:@selector(switchPressed:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)switchPressed:(UISwitch *)theSwitch
{
    NSLog(@"Switch isOn value is: %i",theSwitch.isOn);
    
    if (theSwitch.isOn) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"SwitchKey"];
    } else {
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"SwitchKey"];
    }
    
    // Reorder your table view accordingly.
    
}

@end
