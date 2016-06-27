#import <Foundation/Foundation.h>

// NSString(不可变字符串)
// NSMutableString(可变字符串)

int main(int argc, const char* argv[])
{
	NSLog(@"------->> NSString:");
	NSString* _string = [[NSString alloc] initWithString:@"iOS developer"];
	NSString* _string2 = [[NSString alloc] initWithFormat:@"iOS %@", @"book!"];
	NSLog(@"1.%@",_string);
	NSLog(_string2);

	NSLog(@"2.length[%@] : %d",_string,[_string length]);

	NSLog(@"3.大小写uppercaseString: %@, lowercaseString: %@",[_string uppercaseString],[_string lowercaseString]);
	
	NSString* _intStr = [[NSString alloc] initWithString:@"998.123"];
	NSLog(@"4.字符串类型转换:%@ => bool:%d,int:%d,float:%f,double:%f",_intStr,[_intStr boolValue],[_intStr intValue],
		[_intStr floatValue],[_intStr doubleValue]);
	
	//string => array
	NSArray* _strArray = [_string componentsSeparatedByString:@" "];
	
	NSLog(@"5.字符串截取: %@,%@",[_string substringToIndex:1],[_string substringFromIndex:1]);
	
	NSLog(@"6.字符串拼接: %@",[_string stringByAppendingFormat:@" + %@",_string2]);


    if ([_string isEqualTo:@"iOS developer"]) {
        NSLog(@"7._string isEqualTo => 相等");
    }
    else{
    	NSLog(@"7._string isEqualTo => 不相等");
    }

    
    NSMutableString* mutableString = [[NSMutableString alloc] initWithFormat:@"abcdef"];
    [mutableString insertString:@"xxx" atIndex:2];
    NSLog(@"8.可变字符串,inset xxx new => %@",mutableString);

    //rangeOfString:查找指定字符串所在的范围
    NSRange rangDel = [mutableString rangeOfString:@"xxx"];
    //deleteCharactersInRange:根据范围删除指定的字符串
    [mutableString deleteCharactersInRange:rangDel];
    NSLog(@"9.删除字符串,delete xxx new => %@",mutableString);

    NSRange rangRep = [mutableString rangeOfString:@"def"];
    [mutableString replaceCharactersInRange:rangRep withString:@"abc"];
    NSLog(@"10.替换字符串,replace new => %@",mutableString);


	return 0;
}


// 2016-06-24 17:16:52.423 NSString[2500] ------->> NSString:
// 2016-06-24 17:16:52.428 NSString[2500] 1.iOS developer
// 2016-06-24 17:16:52.428 NSString[2500] iOS book!
// 2016-06-24 17:16:52.428 NSString[2500] 2.length[iOS developer] : 13
// 2016-06-24 17:16:52.429 NSString[2500] 3.大小写uppercaseString: IOS DEVELOPER, lowercaseString: ios developer
// 2016-06-24 17:16:52.429 NSString[2500] 4.字符串类型转换:998.123 => bool:1,int:998,float:998.122986,double:998.123000
// 2016-06-24 17:16:52.430 NSString[2500] 5.字符串截取: i,OS developer
// 2016-06-24 17:16:52.430 NSString[2500] 6.字符串拼接: iOS developer + iOS book!
// 2016-06-24 17:16:52.430 NSString[2500] 7._string isEqualTo => 相等
// 2016-06-24 17:16:52.430 NSString[2500] 8.可变字符串,inset xxx new => abxxxcdef
// 2016-06-24 17:16:52.430 NSString[2500] 9.删除字符串,delete xxx new => abcdef
// 2016-06-24 17:16:52.431 NSString[2500] 10.替换字符串,replace new => abcabc