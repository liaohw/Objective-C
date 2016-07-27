//
//  ViewController.m
//  iOSCaseTool
//
//  Created by liaohw on 16/7/13.
//  Copyright © 2016年 Asiainfo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize textField = _textField;
@synthesize resultsField = _resultsField;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"view load ok!");
    [self.textField setPlaceholder:@"Enter text here"];
    [self.resultsField setText:@"retsult"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)uppercase {
    NSString *original = _textField.text;
    NSString *uppercase = [original uppercaseString];
    _resultsField.text = uppercase;
}

- (IBAction)lowercase {
    NSString *original = _textField.text;
    NSString *lowercase = [original lowercaseString];
    _resultsField.text = lowercase;
}
@end
