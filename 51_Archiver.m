#import <Foundation/Foundation.h>
#import "test.h"

int main(int argc, const char* argv[])
{
    NSAutoreleasePool *autoreleasePool = [[NSAutoreleasePool alloc] init];        
    /****************对象归档********************/
    //对象------>文件
    NSArray *array = [NSArray arrayWithObjects:@"jack",@"john",@"杭州", nil];
    NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent:@"array.arc"];
    //归档对象
    BOOL success = [NSKeyedArchiver archiveRootObject:array toFile:filePath];
    if (success) {
        NSLog(@"归档成功：%@",filePath);
    }

    //文件----->对象
    //解归档
    NSArray *array2 = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    for (NSString *s in array2) {
        NSLog(@"解归档的数据：%@",s);
    }

    [autoreleasePool release];
    return 0;
}
