#import <Foundation/Foundation.h>
#import "52_Singleton.h"

static CUser *instacne = nil;

@implementation CUser

//获取单例对象的类方法
+ (CUser *)shareInstance {
    if (instacne == nil) {
        instacne = [[CUser alloc] init];
    }
    return instacne;
}

//限制方法，限制这个类只能创建一个对象
+ (id)allocWithZone:(NSZone *)zone {
    if (instacne == nil) {
        instacne = [super allocWithZone:zone];
    }
    return instacne;
}

- (id)copyWithZone:(NSZone *)zone {
    return self;
}

- (id)retain {
    return instacne;
}

- (oneway void)release {
}

- (id)autorelease {
    return self;
}

- (NSUInteger)retainCount {
    return UINT_MAX;
}

@end


int main(int argc, const char* argv[])
{
    NSAutoreleasePool *autoreleasePool = [[NSAutoreleasePool alloc] init];

    [autoreleasePool release];
    return 0;
}
