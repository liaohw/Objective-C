#import <Foundation/Foundation.h>
#import "32_ProtocolDelegate.h"
#include <stdlib.h>
// 

@implementation Student
- (NSInteger)work{
    _times = _times + 1;
    NSLog(@"Student work is study (%d)!",_times);
    return _times;
}
- (id)initWithTimes:(NSInteger)times{
    _times = times;
}
@end

@implementation Teacher

- (id)initWithDelegate:(id<_protocolDelegate>)delegate{
    self = [super init];
    if( self != nil){
        _delegate = delegate;
    }
    return self;
}

- (void)call_work {
    //设置定时器
    [NSTimer scheduledTimerWithTimeInterval:1
            target:self
            selector:@selector(timerAction:)
            userInfo:nil
            repeats:YES];
    NSLog(@"Teacher call Student work!");
}

- (void)timerAction:(NSTimer *)timer {
    BOOL response = [_delegate respondsToSelector:@selector(work)];
    if (response) {
        NSInteger workTime = [_delegate work];
        if (workTime > 2) {
            NSLog(@"work times：%ld,停止退出！",workTime);
            //让定时器终止
            [timer invalidate];
        }
    }
}

@end

int main(int argc, const char* argv[])
{
    Student* stu = [[Student alloc] initWithTimes:0];
    Teacher* tea = [[Teacher alloc] initWithDelegate:stu];

    [tea call_work];    
    //NSRunLoop 让程序始终处于运行状态
    [[NSRunLoop currentRunLoop] run];

	return 0;
}

//结果：
// Teacher call Student work!
// Student work is study (1)!
// Student work is study (2)!
// Student work is study (3)!
// work times：3,停止退出！