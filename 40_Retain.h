#import <Foundation/Foundation.h>

@interface Dog : NSObject{
    NSString *_name;
}
- (id)initwithName:(NSString *)name;
- (NSString *)name;
@end

@interface Person : NSObject{
    Dog *_dog;
}

- (void)setDog:(Dog *)dog;
- (Dog *)dog;

//遛狗
- (void)playDog;

@end