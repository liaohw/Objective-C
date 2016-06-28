#import <Foundation/Foundation.h>

// 不可变数组 NSArray ，可变数组 NSMutableArray
// 数组总不可存储基本数据类型，只能存放类的实例；需要把基础数据类型、结构体放入其中需要放入NSNumber\NSValue中进行封装
// 

int main(int argc, const char* argv[])
{
    // 不可变数组 NSArray
    NSString* user = @"john";
    NSString* user2 = @"jack";
    NSArray* array = [[NSArray alloc] initWithObjects:user,user2,nil];
    NSLog(@"1.NSString array: %@",array);

    NSLog(@"2.firt: %@",[array objectAtIndex:0]);

    NSLog(@"3.count: %d",[array count]);

    NSLog(@"4.isContains: %d",[array containsObject:@"john"]);

    NSLog(@"5.indexOfObject: %d",[array indexOfObject:@"john"]);

    NSAutoreleasePool *autoreleasePool = [[NSAutoreleasePool alloc] init];

    //componentsJoinedByString并未修改array
    NSLog(@"6.array join with '&' : %@",[array componentsJoinedByString:@" & "]);
    
    NSLog(@"7.lastObject: %@",[array lastObject]);

    //add new object
    array = [array arrayByAddingObject:@"eva"];

    NSLog(@"8.add object: %@",array);

    //遍历访问
    for(NSString* _s in array){
        NSLog(@"9.for object[] : %@",_s);        
    }

    // 可变数组
    NSMutableArray* marray = [[NSMutableArray alloc] initWithObjects:user,@"EVA",nil];
    NSLog(@"10.NSMutableArray marray: %@",marray);

    [marray replaceObjectAtIndex:0 withObject:user2];
    NSLog(@"11.replace marray: %@",marray);

    NSMutableArray *marray2 = [NSMutableArray arrayWithCapacity:3];
    [marray2 addObjectsFromArray:marray];
    [marray2 removeLastObject];
    NSLog(@"12.new marray: %@",marray2);

    [autoreleasePool release];
    return 0;
}


// 1.NSString array: (john, jack)
// 2.firt: john
// 3.count: 2
// 4.isContains: 1
// 5.indexOfObject: 0
// 6.array join with '&' : john & jack
// 7.lastObject: jack
// 8.add object: (john, jack, eva)
// 9.for object[] : john
// 9.for object[] : jack
// 9.for object[] : eva
// 10.NSMutableArray marray: (john, EVA)
// 11.replace marray: (jack, EVA)
// 12.new marray: (jack)
