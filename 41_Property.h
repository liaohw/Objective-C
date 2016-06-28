#import <Foundation/Foundation.h>

@interface CUser : NSObject {
}

//readonly： 不生成set方法， 只有get方法
@property (nonatomic,copy,readwrite)NSString *name;  //注意括号里面的参数

- (void)showInfo;

@end