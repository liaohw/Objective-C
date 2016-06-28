#import <Foundation/Foundation.h>
#import "40_Retain.h"

// 
@implementation Dog
//自定义初始化方法
- (id)initwithName:(NSString *)name{
    self = [super init];
    if (self != nil) {
        [_name release];
        _name = [name retain];
    }
    NSLog(@"Dog initwithName %@ and retainCount:%d",_name,[self retainCount]);
    return self;
}
- (NSString *)name {
    return _name;
}
- (void)dealloc {
    [_name release];
    NSLog(@"Dog dealloc");
    [super dealloc];
}

@end


@implementation Person
- (void)setDog:(Dog *)dog {
    if (_dog != dog) {
        [_dog release];
        _dog = [dog retain];
    }
    NSLog(@"Person.setDog , dog.retainCount:%d",[_dog retainCount]);
}

- (Dog *)dog {
    return _dog;
}

//遛狗
- (void)playDog {
    NSLog(@"遛狗：%@",_dog.name);
}

- (void)dealloc {
    NSLog(@"Person dealloc with dog release");
    [_dog release];  //释放持有狗的对象所有权
    
    [super dealloc];
}

@end

int main(int argc, const char* argv[])
{
    NSLog(@"----------------引用计数:");
    Person *p = [[Person alloc] init];  //引用计数为1
    NSLog(@"1.init/引用计数：%ld",[p retainCount]); //p.retainCount
    [p retain];  //使引用计数+1
    NSLog(@"2.retain/引用计数：%ld",[p retainCount]);
    [p release]; //使引用计数-1
    NSLog(@"4.release/引用计数：%ld",[p retainCount]);
    [p release];  //引用计数为0,对象会自动销毁掉，销毁之前会调用dealloc方法
    
    NSLog(@"----------------引用计数2:");
    NSLog(@"1.init Dog & Person");
    Dog *dog = [[Dog alloc] initwithName:@"simba"]; //引用计数为1
    Person *person = [[Person alloc] init];  //引用计数为1
    NSLog(@"2.Person setDog Dog");
    [person setDog:dog];
    [person playDog];
    NSLog(@"3.Person release");
    [person release];
    NSLog(@"4.Dog release");
    [dog release];

    return 0;
}


// ----------------引用计数:
// 1.init/引用计数：1
// 2.retain/引用计数：2
// 4.release/引用计数：1
// Person dealloc with dog release
// ----------------引用计数2:
// 1.init Dog & Person
// Dog initwithName simba and retainCount:1
// 2.Person setDog Dog
// Person.setDog , dog.retainCount:2
// 遛狗：simba
// 3.Person release
// Person dealloc with dog release
// 4.Dog release
// Dog dealloc