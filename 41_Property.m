#import <Foundation/Foundation.h>
#import "41_Property.h"

// 

@implementation CUser
//生成的属性名叫$name 而不是_name
@synthesize name = $name;
- (void)showInfo {
    NSLog(@"用户名：%@",$name);
}
@end

int main(int argc, const char* argv[])
{
    NSLog(@"----------------引用计数:");
    CUser *user = [[CUser alloc] init];
    [user setName:@"admin"];
    
    [user showInfo];
    return 0;
}
