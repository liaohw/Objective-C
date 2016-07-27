//
//  ViewController.h
//  iOSCaseTool
//
//  Created by liaohw on 16/7/13.
//  Copyright © 2016年 Asiainfo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *resultsField;
- (IBAction)uppercase;
- (IBAction)lowercase;

@end

