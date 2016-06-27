#import <Foundation/Foundation.h>

// 
int main(int argc, const char* argv[])
{
    NSLog(@"----------------NSNumber:");
    NSNumber *intNumber = [NSNumber numberWithInt:100];
    NSNumber *floatNumber = [NSNumber numberWithFloat:9.8f];
    NSNumber *longNumber = [NSNumber numberWithLong:123456789];
    NSNumber *boolNumber = [NSNumber numberWithBool:YES];
    
    NSArray *array = [[NSArray alloc] initWithObjects:intNumber,floatNumber,longNumber,boolNumber,nil];
    NSLog(@"array=%@",array);

    NSLog(@"intNumber=%d",[intNumber intValue]);
    NSLog(@"floatNumber=%0.2f",[floatNumber floatValue]);
    NSLog(@"boolNumber=%d",[boolNumber boolValue]);

    NSLog(@"----------------NSValue:");
    struct CUser{
        int _id;
        int _age;
    };
    struct CUser user = {1001,20};
    NSValue* pValue = [NSValue value:&user withObjCType:@encode(struct CUser)];
    //NSArray不能存基本类型，需要封装到NSValue保存
    NSArray* array2 = [[NSArray alloc] initWithObjects:pValue,nil];
    struct CUser user2;
    [pValue getValue:&user2];
    NSLog(@"user2._id=%d",user2._id);

    NSLog(@"----------------NSNull:");
    NSNull *n1 = [NSNull null];
    NSNull *n2 = [NSNull null];
    NSArray *arrayNull = [[NSArray alloc] initWithObjects:n1,n2,nil];
    NSLog(@"%@",arrayNull);
    for (id item in arrayNull) {
        //判断数组中的对象是否为一个NSNull对象，如果是，则过滤掉
        if (item == [NSNull null]) {
            NSLog(@"item is null,continue!");
            continue;
        }
    }

	return 0;
}
