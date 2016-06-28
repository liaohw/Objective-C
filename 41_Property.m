//
//  41_Property.m
//  41_Property
//
//  Created by liaohw on 16/6/27.
//  Copyright © 2016年 Asiainfo.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "main.h"

@implementation CUser

//生成的属性名叫$name 而不是_name
@synthesize name = $name;

- (void)showInfo {
    NSLog(@"showInfo 用户名：%@",$name);
}

@end

int main(int argc, const char* argv[])
{
    NSLog(@"----------------引用计数:");
    CUser *user = [[CUser alloc] init];
    [user setName:@"admin"];
    
    [user showInfo];
    NSLog(@"user.name ：%@",[user name]);
    
    return 0;
}

//----------------引用计数:
//showInfo 用户名：admin
//user.name ：admin
