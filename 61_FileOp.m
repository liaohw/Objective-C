#import <Foundation/Foundation.h>

// 

int main(int argc, const char* argv[])
{
    
    // NSDate 数据的抽象，可存储音频、视频、图片、文本等数据
    NSLog(@"----------------NSDate----------------------------");
    NSString *init_s = @"simbababa";
    NSData *data = [init_s dataUsingEncoding:NSUTF8StringEncoding];
    NSString *initstr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"initstr = %@",initstr);
    
    NSString *homePath = NSHomeDirectory();
    NSLog(@"Home目录：%@", homePath);
    
    
    
    // NSFileManager操作文件
    NSLog(@"----------------NSFileManager----------------------------");
    //追加子路径
    NSString *filePath = [homePath stringByAppendingPathComponent:@"oc.txt"];
    
    //NSFileManager类设计为单实例，只能通过类方法defaultManager 创建
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    //根据路径filePath创建对应的文件，注意：只能创建文件，不能创建目录(文件夹)
    BOOL success = [fileManager createFileAtPath:filePath
                                        contents:data
                                      attributes:nil];
    if (success) {
        NSLog(@"创建文件：%@",filePath);
    } else {
        NSLog(@"创建文件失败");
    }
    
    NSString *filePath2 = [homePath stringByAppendingPathComponent:@"demo"];
    NSError *error;
    //判断文件是否存在
    BOOL fileExist = [fileManager fileExistsAtPath:filePath2];
    if (fileExist) {
        NSLog(@"目录已经存在!!");
        //删除文件
        success = [fileManager removeItemAtPath:filePath2 error:&error];
        if (success) {
            NSLog(@"删除目录成功!!");
        }
    }
    //创建文件夹
    success = [fileManager createDirectoryAtPath:filePath2
                     withIntermediateDirectories:YES
                                      attributes:nil
                                           error:&error];
    if (success) {
        NSLog(@"创建目录: %@",filePath2);
    } else {
        NSLog(@"目录创建失败: %@",error);
    }
    
    //根据路径读取文件中的数据
    NSData *readdata = [fileManager contentsAtPath:filePath];
    NSString *string = [[NSString alloc] initWithData:readdata encoding:NSUTF8StringEncoding];
    NSLog(@"读取文件中的数据: %@",string);
    
    
    // writeToFile写文件
    NSString *hz = @"**liao";
    [hz writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:&error];
    NSLog(@"writeToFile数据: %@",hz); //覆盖原来的数据
    
    
    
    // NSFileHandle读写文件内容，writeData写入数据
    NSLog(@"----------------NSFileHandle----------------------------");
    
    NSFileHandle *writeHandle = [NSFileHandle fileHandleForWritingAtPath:filePath];
    //将文件的偏移量设置到末尾，写入文件时则从末尾开始写入
    [writeHandle seekToEndOfFile];
    NSString *appendString = @"hongwei";
    //从当前偏移量开始写入数据（偏移量默认是起始位置）
    [writeHandle writeData:[appendString dataUsingEncoding:NSUTF8StringEncoding]];
    NSLog(@"seekToEndOfFile,writeData数据: %@",appendString);
    //关闭文件
    [writeHandle closeFile];
    
    // 读写偏移
    NSLog(@"----------------读写偏移----------------------------");
    NSFileHandle *readHandle = [NSFileHandle fileHandleForReadingAtPath:filePath];
    [readHandle seekToFileOffset:2];
    NSData *data2 = [readHandle readDataToEndOfFile];
    NSString *string2 = [[NSString alloc] initWithData:data2 encoding:NSUTF8StringEncoding];
    NSLog(@"%@",string2);
    
    
    
    NSLog(@"----------------initWithContentsOfFile--------------");
    // initWithContentsOfFile 读文件
    NSData *dataRd = [[NSData alloc] initWithContentsOfFile:filePath];
    NSLog(@"initWithContentsOfFile: %@",[[NSString alloc] initWithData:dataRd encoding:NSUTF8StringEncoding]);
    
    return 0;
}

// 2016-06-29 20:07:43.854 oc_code1[2685:262627] ----------------NSDate----------------------------
// 2016-06-29 20:07:43.855 oc_code1[2685:262627] initstr = simbababa
// 2016-06-29 20:07:43.856 oc_code1[2685:262627] Home目录：/Users/liaohw
// 2016-06-29 20:07:43.856 oc_code1[2685:262627] ----------------NSFileManager----------------------------
// 2016-06-29 20:07:43.857 oc_code1[2685:262627] 创建文件：/Users/liaohw/oc.txt
// 2016-06-29 20:07:43.858 oc_code1[2685:262627] 目录已经存在!!
// 2016-06-29 20:07:43.858 oc_code1[2685:262627] 删除目录成功!!
// 2016-06-29 20:07:43.863 oc_code1[2685:262627] 创建目录: /Users/liaohw/demo
// 2016-06-29 20:07:43.863 oc_code1[2685:262627] 读取文件中的数据: simbababa
// 2016-06-29 20:07:43.864 oc_code1[2685:262627] writeToFile数据: **liao
// 2016-06-29 20:07:43.864 oc_code1[2685:262627] ----------------NSFileHandle----------------------------
// 2016-06-29 20:07:43.864 oc_code1[2685:262627] seekToEndOfFile,writeData数据: hongwei
// 2016-06-29 20:07:43.864 oc_code1[2685:262627] ----------------读写偏移----------------------------
// 2016-06-29 20:07:43.864 oc_code1[2685:262627] liaohongwei
// 2016-06-29 20:07:43.864 oc_code1[2685:262627] ----------------initWithContentsOfFile--------------
// 2016-06-29 20:07:43.865 oc_code1[2685:262627] initWithContentsOfFile: **liaohongwei
// Program ended with exit code: 0
