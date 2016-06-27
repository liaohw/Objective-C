#import <Foundation/Foundation.h>

@interface CUser : NSObject
{
	//默认protected
@protected
	NSInteger _user_id;
	NSString* _name;
}
- (id)initWithName:(NSString*) name;
- (id)initWithName:(NSString*) name withId:(NSInteger) user_id;
- (void)setUserId:(NSInteger) user_id;
- (NSString*)setName:(NSString*) name;

- (NSString*)name;
- (NSInteger)user_id;

- (void)showInfo;

+ (void)sayHi;
@end

@interface CUserProm : CUser
{
	NSInteger _prod_id;
}
- (id)initWithId:(NSInteger) prod_id;
- (void)showInfo;

@end


@interface CTest : NSObject
{
}
- (void)show:(CUser*) _user;
@end