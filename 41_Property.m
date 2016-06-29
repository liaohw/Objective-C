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


// @property并不只是可以生成getter和setter方法，它还可以做内存管理，
// 如：
// 	@property(nonatomic, retain) UITextField *userName;    //1
// 	@property(nonatomic, retain,readwrite) UITextField *userName;  //2

// 	@property(atomic, retain) UITextField *userName;  //3
// 	@property(retain) UITextField *userName;  //4

// 	@property(atomic,assign) int i;         // 5
// 	@property(atomic) int i;         //6
// 	@property int i;               //7
// 上面的代码1和2是等价的，3和4是等价的，5,6,7是等价的。
// （也就是说atomic是默认行为，assign是默认行为，readwrite是默认行为）

// @synthesize去让编译器生成代码，那么atomic和nonatomic生成的代码是不一样的。
// 如果使用atomic，如其名，它会保证每次getter和setter的操作都会正确的执行完毕，而不用担心其它线程在你get的时候set，可以说保证了某种程度上的线程安全。
// nonatomic比atomic速度要快。

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
