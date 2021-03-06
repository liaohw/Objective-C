#import <Foundation/Foundation.h>
#import "10_Class.h"

// Objective-C实现类的封装、继承、多态

@implementation CUser
- (id)initWithName:(NSString*) name{
    self = [super init];
    if(self != nil){
        _name = name;
    }
    return self;
}
- (id)initWithName:(NSString*) name withId:(NSInteger) user_id{
    self = [super init];
    if(self != nil){
        _name = name;
        _user_id = user_id;
    }
    return self;
}
- (void)setUserId:(NSInteger)user_id {
    _user_id = user_id;
}
- (NSString*)setName:(NSString*) name{
    _name = name;
}
- (NSString*)name{
    return _name;
}
- (NSInteger)user_id{
    return _user_id;
}
- (void)showInfo{
    NSLog(@"user showInfo : %@, user id : %d",_name,_user_id);
}
+ (void)sayHi{
    NSLog(@"CUser say hi!");
}

//如果未实现：<CUser: 0x2a37fa8>
//重载实现：user description : jack, user id : 998
- (NSString*) description{
    NSString* desc = [NSString stringWithFormat:@"user description : %@, user id : %d",_name,_user_id];
    return desc;
}
@end


@implementation CUserProm
- (id)initWithId:(NSInteger) prod_id {
    _prod_id = prod_id;
}
- (void)showInfo{
    NSLog(@"CUserProm showInfo : %@, user id : %d, prod id : %d",_name,_user_id,_prod_id);
}
@end

@implementation CTest
- (void)show:(CUser*) _user
{
    [_user showInfo];
}
@end

int main(int argc, const char* argv[])
{
    NSLog(@"-------run begin");
    [CUser sayHi];
    CUser* user = [[CUser alloc] init];
    // id user = [[CUser alloc] init];
    [user setName:@"jack"];        //id user 的话这里会有问题
    [user setUserId:998];
    [user showInfo];
    NSLog(@"%@",user);

    NSLog(@"**********************");
    CUser* user2 = [[CUser alloc] initWithName:@"eva" withId:666];
    [user2 showInfo];
    user2.name = @"test name";
    [user2 showInfo];

    NSLog(@"**********************");
    CUserProm* userProm = [[CUserProm alloc] initWithId:1001];
    [userProm showInfo];

    NSLog(@"**********************");
    CTest* test = [[CTest alloc] init];
    [test show:user];
    [test show:userProm];

    return 0;
}

// 测试结果：
// -------run begin
// CUser say hi!
// user showInfo : jack, user id : 998
// user description : jack, user id : 998
// **********************
// user showInfo : eva, user id : 666
// user showInfo : test name, user id : 666
// **********************
// CUserProm showInfo : (null), user id : 0, prod id : 1001
// **********************
// user showInfo : jack, user id : 998
// CUserProm showInfo : (null), user id : 0, prod id : 1001