#import <Foundation/Foundation.h>
// 

int main(int argc, const char* argv[])
{
    //Home目录:
    //模拟器 /Users/liaohw/Library/Application Support/iPhone Simulator/5.1/Applications/xxx
    //真机 /var/mobile/Applications/xxx
    NSString *homePath = NSHomeDirectory();
    NSLog(@"1.homePath：%@", homePath);
    
    //1.返回路径的组成部分
    NSArray *array = [homePath pathComponents];
    NSLog(@"2.homePath.pathComponents:%@",array);
    
    //2.路径的最后组成部分
    NSString *lastComponent = [homePath lastPathComponent];
    NSLog(@"3.homePath.lastComponent:%@",lastComponent);
    
    //3.追加子路径
    NSString *newPath1 = [homePath stringByAppendingString:@"/README.md"];
    // NSString *newPath2 = [homePath stringByAppendingPathComponent:@"README.md"];
    NSLog(@"4.newPath1:%@",newPath1);
    
    
    //4.删除最后的组成部分
    NSString *deleteLast = [homePath stringByDeletingLastPathComponent];
    NSLog(@"5.homePath.deleteLast:%@",deleteLast);
    
    //5.删除扩展名
    NSString *deleteExtension = [newPath1 stringByDeletingPathExtension];
    NSLog(@"6.newPath1.deleteExtension:%@",deleteExtension);
    
    //6.获取路径最后部分的扩展名
    NSString *extension = [newPath1 pathExtension];
    NSLog(@"7.newPath1.extension:%@",extension);
    
    //7.追加扩展名
    NSString *appendExt = [homePath stringByAppendingPathExtension:@"jpg"];
    NSLog(@"8.homePath.appendExt:%@",appendExt);

    
    return 0;
}


// 2016-06-29 20:04:16.461 oc_code1[2657:261204] 1.homePath：/Users/liaohw
// 2016-06-29 20:04:16.462 oc_code1[2657:261204] 2.homePath.pathComponents:(
//     "/",
//     Users,
//     liaohw
// )
// 2016-06-29 20:04:16.462 oc_code1[2657:261204] 3.homePath.lastComponent:liaohw
// 2016-06-29 20:04:16.462 oc_code1[2657:261204] 4.newPath1:/Users/liaohw/README.md
// 2016-06-29 20:04:16.462 oc_code1[2657:261204] 5.homePath.deleteLast:/Users
// 2016-06-29 20:04:16.462 oc_code1[2657:261204] 6.newPath1.deleteExtension:/Users/liaohw/README
// 2016-06-29 20:04:16.462 oc_code1[2657:261204] 7.newPath1.extension:md
// 2016-06-29 20:04:16.462 oc_code1[2657:261204] 8.homePath.appendExt:/Users/liaohw.jpg
// Program ended with exit code: 0