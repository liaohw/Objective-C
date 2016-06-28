#import <Foundation/Foundation.h>
#import "42_AutoreleasePool.h"

// 
@implementation Dog
//自定义初始化方法
- (id)initwithName:(NSString *)name{
    self = [super init];
    if (self != nil) {
        [_name release];
        _name = [name retain];
    }
    NSLog(@"Dog initwithName %@ retainCount:%d",_name,[self retainCount]);
    return self;
}
- (NSString *)name {
    return _name;
}
- (void)release {
    NSLog(@"[release] Dog:%@ retainCount:%d",_name,[self retainCount]-1);
    [super release];
}
- (id)retain {
    id dog = [super retain];
    NSLog(@"[retain] Dog:%@ retainCount:%d",_name,[self retainCount]);
    return dog;
}
- (void)dealloc {
    [_name release];
    NSLog(@"~dealloc Dog:%@",_name);
    [super dealloc];
}

@end


@implementation Person
- (id)initWithDogname:(NSString *)dogName {
    self = [super init];
    if (self != nil) {
        _dog = [[Dog alloc] initwithName:dogName];
    }
    return self;
}
- (void)setDog:(Dog *)dog {
    if (_dog != dog) {
        if(_dog == nil){
            NSLog(@"Person._dog is nil");
        }
        else{
            [_dog release];
        }
        _dog = [dog retain];
    }
}

- (Dog *)dog {
    return _dog;
}

//遛狗
- (void)playDog {
    NSLog(@"遛狗：%@",_dog.name);
}

- (void)dealloc {
    NSLog(@"~dealloc Person with dog :%@ release",_dog.name);
    [_dog release];  //释放持有狗的对象所有权
    
    [super dealloc];
}

@end

int main(int argc, const char* argv[])
{
    NSAutoreleasePool *autoreleasePool = [[NSAutoreleasePool alloc] init];
    NSLog(@"----------------autorelease:");
    Person *person = [[Person alloc] init];  //引用计数为1
    Dog *simba = [[Dog alloc] initwithName:@"Simba"]; //引用计数为1
    Dog *amy = [[Dog alloc] initwithName:@"Amy"]; //引用计数为1
    [simba autorelease];
    [amy autorelease];
    NSLog(@"1.Person setDog Dog");
    [person setDog:amy];
    NSLog(@"2.Person setDog Dog");
    [person setDog:simba];
    [person playDog];
    NSLog(@"3.Person release");
    [person release];
    NSLog(@"4.Two dog release");
    //方法一
    // [simba release];
    // [amy release];
    //方法二：会对池子中的每一个对象发送release消息(调用了release方法),但是pool对象没有销毁
    [autoreleasePool drain];
    //方法三：当自动释放池销毁的时候，会对池子中的每一个对象发送release消息(调用了release方法)
    // [autoreleasePool release];

    NSLog(@"----------------autorelease2:");
    Person *person2 = [[Person alloc] initWithDogname:@"Aoly"];
    [person2 release];
    
    NSLog(@"----------------end");
    return 0;
}

// ----------------autorelease:
// Dog initwithName Simba retainCount:1
// Dog initwithName Amy retainCount:1
// 1.Person setDog Dog
// Person._dog is nil
// [retain] Dog:Amy retainCount:2
// 2.Person setDog Dog
// [release] Dog:Amy retainCount:1
// [retain] Dog:Simba retainCount:2
// 遛狗：Simba
// 3.Person release
// ~dealloc Person with dog :Simba release
// [release] Dog:Simba retainCount:1
// 4.Two dog release
// [release] Dog:Simba retainCount:0
// ~dealloc Dog:Simba
// [release] Dog:Amy retainCount:0
// ~dealloc Dog:Amy
// ----------------autorelease2:
// Dog initwithName Aoly retainCount:1
// ~dealloc Person with dog :Aoly release
// [release] Dog:Aoly retainCount:0
// ~dealloc Dog:Aoly
// ----------------end

