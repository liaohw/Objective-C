#import <Foundation/Foundation.h>

// 
int main(int argc, const char* argv[])
{
    NSDate *date = [[NSDate alloc] init];
    NSLog(@"date : %@",date);

    //在当前日期的基础上累加一个数值,单位是秒
    NSDate *tm_date = [NSDate dateWithTimeIntervalSinceNow:24*60*60];
    NSLog(@"明天:%@",tm_date);

    NSDate *date2 = [NSDate dateWithTimeIntervalSinceNow:-24*60*60];
    NSLog(@"昨天:%@",date2);

    NSDate *date1970 = [NSDate dateWithTimeIntervalSince1970:5];
    NSLog(@"1970年+时间戳数值:%@",date1970);

    NSTimeInterval time1970 = [date timeIntervalSince1970];
    NSLog(@"date的时间戳:%f",time1970);

    //到当前日期时间的数值差
    NSTimeInterval timeNow = [date timeIntervalSinceNow];
    NSLog(@"到当前日期时间的数值差:%f",timeNow);

    NSComparisonResult result = [tm_date compare:date];
    if (result == NSOrderedDescending) {
        NSLog(@"日期的比较 : %@ > %@",tm_date,date);
    }
    if ([tm_date timeIntervalSince1970] > [date timeIntervalSince1970]) {
        NSLog(@"日期的时间戳比较: %f > %f",[tm_date timeIntervalSince1970],[date timeIntervalSince1970]);
    }   


    // NSDateFormatter格式化日期
    NSDate *nowDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy年MM月dd日 HH:mm:ss"];
    NSTimeZone *timezone = [NSTimeZone timeZoneWithName:@"America/New_York"];
    [dateFormatter setTimeZone:timezone];
    NSString *datestring = [dateFormatter stringFromDate:nowDate];
    NSLog(@"%@ 按New_York时区日期格式化之后：%@",nowDate,datestring);


    NSString *string = @"2016年06月26日 12:00:00";
    NSDateFormatter *dateFormatter2 = [[NSDateFormatter alloc] init];
    [dateFormatter2 setDateFormat:@"yyyy年MM月dd日 HH:mm:ss"];
    NSDate *formatDate = [dateFormatter2 dateFromString:string];
    NSLog(@"字符串格式化成日期：%@",formatDate);


    //获取到所有时区的名称
    NSArray *zoneNames = [NSTimeZone knownTimeZoneNames];
    for (NSString *name in zoneNames) {
        NSLog(@"%@",name);
    }


	return 0;
}
