#import <Foundation/Foundation.h>

@interface Dog : NSObject{
    NSString *_name;
}
- (id)initwithName:(NSString *)name;
- (NSString *)name;
- (void)release;
- (id)retain;
@end

@interface Person : NSObject{
    Dog *_dog;
}
- (id)initWithDogname:(NSString *)dogName;
- (void)setDog:(Dog *)dog;
- (Dog *)dog;

//遛狗
- (void)playDog;

@end