//
//  ViewController.m
//  CaseTool
//
//  Created by liaohw on 16/7/12.
//  Copyright © 2016年 Asiainfo. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    NSLog(@"view load ok!");
    [self.textField setPlaceholderString:@"Enter text here"];
    [self.resultsField setStringValue:@"retsult"];
}
- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}
- (IBAction)uppercase:(id)sender
{
    NSString *original = [_textField stringValue];
    NSString *uppercase = [original uppercaseString];
    [_resultsField setStringValue:uppercase];
}

- (IBAction)lowercase:(id)sender
{
    NSString *original = [_textField stringValue];
    NSString *lowercase = [original lowercaseString];
    [_resultsField setStringValue:lowercase];
}
@end
