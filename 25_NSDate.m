#import <Foundation/Foundation.h>

// 
int main(int argc, const char* argv[])
{
    NSDate *date = [[NSDate alloc] init];
    NSLog(@"1.date : %@",date);

    NSAutoreleasePool *autoreleasePool = [[NSAutoreleasePool alloc] init];
    //在当前日期的基础上累加一个数值,单位是秒
    NSDate *tm_date = [NSDate dateWithTimeIntervalSinceNow:24*60*60];
    NSLog(@"2.明天:%@",tm_date);

    NSDate *date2 = [NSDate dateWithTimeIntervalSinceNow:-24*60*60];
    NSLog(@"3.昨天:%@",date2);

    NSDate *date1970 = [NSDate dateWithTimeIntervalSince1970:5];
    NSLog(@"4.1970年+时间戳数值:%@",date1970);

    NSTimeInterval time1970 = [date timeIntervalSince1970];
    NSLog(@"5.date的时间戳:%f",time1970);

    //到当前日期时间的数值差
    NSTimeInterval timeNow = [date timeIntervalSinceNow];
    NSLog(@"6.到当前日期时间的数值差:%f",timeNow);

    NSComparisonResult result = [tm_date compare:date];
    if (result == NSOrderedDescending) {
        NSLog(@"7.日期的比较 : %@ > %@",tm_date,date);
    }
    if ([tm_date timeIntervalSince1970] > [date timeIntervalSince1970]) {
        NSLog(@"8.日期的时间戳比较: %f > %f",[tm_date timeIntervalSince1970],[date timeIntervalSince1970]);
    }   


    // NSDateFormatter格式化日期
    NSDate *nowDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy年MM月dd日 HH:mm:ss"];
    NSTimeZone *timezone = [NSTimeZone timeZoneWithName:@"America/New_York"];
    [dateFormatter setTimeZone:timezone];
    NSString *datestring = [dateFormatter stringFromDate:nowDate];
    NSLog(@"9.%@ 按New_York时区日期格式化之后：%@",nowDate,datestring);


    NSString *string = @"2016年06月26日 12:00:00";
    NSDateFormatter *dateFormatter2 = [[NSDateFormatter alloc] init];
    [dateFormatter2 setDateFormat:@"yyyy年MM月dd日 HH:mm:ss"];
    NSDate *formatDate = [dateFormatter2 dateFromString:string];
    NSLog(@"10.字符串格式化成日期：%@",formatDate);


    //获取到所有时区的名称
    NSArray *zoneNames = [NSTimeZone knownTimeZoneNames];
    for (NSString *name in zoneNames) {
        NSLog(@"11.zoneNames:%@",name);
        break;
    }

    [autoreleasePool release];
    return 0;
}

// 1.date : 2016-06-28 11:05:40 +0800
// 2.明天:2016-06-29 11:05:40 +0800
// 3.昨天:2016-06-27 11:05:40 +0800
// 4.1970年+时间戳数值:1970-01-01 08:00:05 +0800
// 5.date的时间戳:1467083140.467000
// 6.到当前日期时间的数值差:-0.029000
// 7.日期的比较 : 2016-06-29 11:05:40 +0800 > 2016-06-28 11:05:40 +0800
// 8.日期的时间戳比较: 1467169540.495000 > 1467083140.467000
// 9.2016-06-28 11:05:40 +0800 按New_York时区日期格式化之后：20160627 11:05 下午
// 10.字符串格式化成日期：2016-06-26 20:00:00 +0800
// 11.zoneNames:Zulu