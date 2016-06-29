#import <Foundation/Foundation.h>
#import "test.h"

// 

int main(int argc, const char* argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];



    //Home目录:
    //模拟器 /Users/liaohw/Library/Application Support/iPhone Simulator/5.1/Applications/xxx  
    //真机 /var/mobile/Applications/xxx
	NSString *homePath = NSHomeDirectory();  
	NSLog(@"Home目录：%@", homePath);  

    //1.返回路径的组成部分
    NSArray *array = [homePath pathComponents];
    NSLog(@"pathComponents:%@",array);
    
    //2.路径的最后组成部分
    NSString *lastComponent = [homePath lastPathComponent];
    NSLog(@"lastComponent:%@",lastComponent);
    
    //3.追加子路径
    NSString *newPath1 = [homePath stringByAppendingString:@"/README.md"];
    // NSString *newPath2 = [homePath stringByAppendingPathComponent:@"README.md"];
    NSLog(@"newPath1=%@",newPath1);
    
    
    //4.删除最后的组成部分
    NSString *deleteLast = [homePath stringByDeletingLastPathComponent];
    NSLog(@"deleteLast:%@",deleteLast);
    
    //5.删除扩展名
    NSString *deleteExtension = [homePath stringByDeletingPathExtension];
    NSLog(@"deleteExtension:%@",deleteExtension);
    
    //6.获取路径最后部分的扩展名
    NSString *extension = [homePath pathExtension];
    NSLog(@"extension:%@",extension);
    
    //7.追加扩展名
    NSString *appendExt = [homePath stringByAppendingPathExtension:@"jpg"];
    NSLog(@"appendExt:%@",appendExt);
        

	[pool release];
    return 0;
}
