#import <Foundation/Foundation.h>
#import "test.h"

int main(int argc, const char* argv[])
{
    NSAutoreleasePool *autoreleasePool = [[NSAutoreleasePool alloc] init];
    NSMutableArray *array1 = [NSMutableArray arrayWithObjects:@"one",@"two", nil];
    [array1 retain];  //引用计数:2
    
    //copy复制出来的对象是不可变的
    NSArray *array2 = [array1 copy];
    if (array1 != array2) {
        NSLog(@"array1 != array2,是两个对象");
        
        NSLog(@"array1的引用计数：%ld",array1.retainCount);
        NSLog(@"array2的引用计数：%ld",array2.retainCount);
    }
    NSLog(@"--------------------------------------------------");
    //mutableCopy 复制出来的对象是可变
    NSMutableArray *array3 = [array1 mutableCopy];
    [array3 addObject:@"three"];
    if (array1 != array3) {
        NSLog(@"array1 != array3,是两个对象");
        NSLog(@"array1：%@",array1);
        NSLog(@"array3：%@",array3);
    }

    NSLog(@"-----------------数组浅拷贝------------------------------");

    NSMutableArray *mArray = [NSMutableArray arrayWithCapacity:2];
    //创建2个对象，添加到数组中
    for (int i=0; i<2; i++) {
        NSString *p = [[NSString alloc] initWithFormat:@"string_%d",i];
        [mArray addObject:p];
        [p release];
    }
    //复制之前数组中对象的引用计数
    for (NSString *p in mArray) {
        NSLog(@"复制之前的指针：%p , 引用计数：%ld",p,p.retainCount);
    }
    //复制数组，arr20是新复制出来的副本对象
    NSArray *array4 = [mArray copy];
    //副本对象中的元素的引用计数
    for (NSString *p in array4) {
        NSLog(@"复制之后的指针：%p , 引用计数：%ld",p,p.retainCount);
    }

    NSLog(@"-----------------字符串的深、浅拷贝------------------------------");
    NSString* init_str = [[NSString alloc] initWithString:@"simba"];
    NSLog(@"init_str ：%p, %@, 引用计数：%ld",init_str,init_str,init_str.retainCount);
    NSLog(@"-----------------浅拷贝");
    NSString* copy_str = [init_str copy];
    NSLog(@"init_str ：%p, %@, 引用计数：%ld",init_str,init_str,init_str.retainCount);
    NSLog(@"copy_str ：%p, %@, 引用计数：%ld",copy_str,copy_str,copy_str.retainCount);
    NSLog(@"-----------------深拷贝");
    NSString* copy_str2 = [[NSString alloc] initWithString:init_str];
    NSLog(@"init_str ：%p, %@, 引用计数：%ld",init_str,init_str,init_str.retainCount);
    NSLog(@"copy_str2 ：%p, %@, 引用计数：%ld",copy_str2,copy_str2,copy_str2.retainCount);

    //array1,arrayWithObjects,之前有retain，所以需要release
    [array1 release];    
    [array2 release];
    [array3 release];
    // [mArray release]; //mArray不能release，arrayWithCapacity是autorelease，autoreleasePool在release会释放
    [array4 release];
    //init\copy\retain需要release，而arrayWithCapacity、arrayWithObjects是autorelease不需要release
    [init_str release];    
    [copy_str release];
    [copy_str2 release];

    [autoreleasePool release];
    return 0;
}

// array1 != array2,是两个对象
// array1的引用计数：2
// array2的引用计数：1
// --------------------------------------------------
// array1 != array3,是两个对象
// array1：(one, two)
// array3：(one, two, three)
// -----------------数组浅拷贝------------------------------
// 复制之前的指针：0x544fb8 , 引用计数：1
// 复制之前的指针：0x544f88 , 引用计数：1
// 复制之后的指针：0x544fb8 , 引用计数：2
// 复制之后的指针：0x544f88 , 引用计数：2
// -----------------字符串的深、浅拷贝------------------------------
// init_str ：0x2aeed30, simba, 引用计数：1
// -----------------浅拷贝
// init_str ：0x2aeed30, simba, 引用计数：2
// copy_str ：0x2aeed30, simba, 引用计数：2
// -----------------深拷贝
// init_str ：0x2aeed30, simba, 引用计数：2
// copy_str2 ：0x2aeed68, simba, 引用计数：1
