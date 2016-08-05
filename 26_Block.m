#import <Foundation/Foundation.h>

// NSString(不可变字符串)
// NSMutableString(可变字符串)

int main(int argc, const char* argv[])
{
    NSAutoreleasePool *autoreleasePool = [[NSAutoreleasePool alloc] init];

    //我也可以直接在这里声明的时候进行定义；
    void(^block)(int a) = ^(int a){
        NSLog("@%d",a);
    };
    block(3);

    //Block值捕获
    int num = 10;
    void(^myBlock)(void) = ^(void){
        //我们可以在block内部访问到外部的变量，但是不能修改；
        NSLog(@"num = %d",num);
    };
    myBlock();

    //Block值捕获
    __block int num2 = 10;
    void(^myBlock2)(void) = ^(void){
        //我们可以在block内部访问到外部的变量，但是不能修改；
        NSLog(@"num2 = %d",num2);
        num2 = 20;//修改外部变量的值；       
    };
    myBlock2();
    NSLog(@"num2 = %d",num2);

    [autoreleasePool release];
    return 0;
}

