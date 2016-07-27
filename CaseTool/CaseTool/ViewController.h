//
//  ViewController.h
//  CaseTool
//
//  Created by liaohw on 16/7/12.
//  Copyright © 2016年 Asiainfo. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController
@property (weak) IBOutlet NSTextField *textField;
@property (weak) IBOutlet NSTextField *resultsField;
- (IBAction)uppercase:(id)sender;
- (IBAction)lowercase:(id)sender;


@end

