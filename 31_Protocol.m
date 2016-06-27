#import <Foundation/Foundation.h>
#import "31_Protocol.h"

// 

@implementation Student

//学习的方法
- (void)study {
    NSLog(@"Student need study!");
    [self work];
}

- (void)work{
    NSLog(@"study is Student's work!");
}

- (void)eat{
    NSLog(@"Student eat!");
}


@end

int main(int argc, const char* argv[])
{
    Student* stu = [[Student alloc] init];
    [stu study];    

    //判断方法是否在Student类中定义,如果定义了，才调用
    if ([stu respondsToSelector:@selector(eat)]) {
        [stu eat];
    }
    if ([stu respondsToSelector:@selector(drink)] == NO) {
        NSLog(@"Student is no drink!");
    }

	return 0;
}

// 2016-06-27 15:22:38.960 31_Protocol[712] Student need study!
// 2016-06-27 15:22:38.968 31_Protocol[712] study is work!
// 2016-06-27 15:22:38.968 31_Protocol[712] Student eat!
// 2016-06-27 15:22:38.968 31_Protocol[712] Student no drink!