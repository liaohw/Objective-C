#import <Foundation/Foundation.h>
#import "30_Extension.h"

// Foundation举例

@implementation NSString (Extension)

- (BOOL)validateEmail {
    NSRange rang = [self rangeOfString:@"@"];
    if (rang.location == NSNotFound) {
        return NO;
    }
    return YES;
}

//通过类目覆写NSString的方法
//覆写此方法之后，原始类的intValue方法则无法调用了
- (int)intValue {
    NSLog(@"new intValue");
    return 100;
}

@end



//延展：用于声明私有的方法
@interface Person (private)
- (void)_showInfo;
@end

@implementation Person 

- (void)work {
    [self _showInfo];
    NSLog(@"开始工作");
}

//私有的方法【延展方法的实现】
- (void)_showInfo {
    NSLog(@"显示我的信息");
}

@end

int main(int argc, const char* argv[])
{
	NSLog(@"-------------------使用类目/邮箱验证");
	//使用类目，为现有的类NSString扩展方法，是新方法成为类的一部分，且子类也能继承
    NSString *s = @"jack@qq.com";
    BOOL isEmail = [s validateEmail];
    if (isEmail) {
        NSLog(@"验证通过");
    } else {
        NSLog(@"邮箱不合法");
    }
    
    //优先调用类目覆写的intValue方法
    int len = [s intValue];
    NSLog(@"len=%d",len);
	/*	类目的不足:
		1.类目还可以覆写现有类的方法。覆写后，原始方法则无法调用。
		2.类目不能为类扩展实例属性。
	*/
    
	NSLog(@"-------------------使用类目/延展的使用");    
	Person *p = [[Person alloc] init];
    [p work];

	return 0;
}
