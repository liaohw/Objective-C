#import <Foundation/Foundation.h>

@interface CUser : NSObject<NSCopying>

@property(nonatomic,copy)NSString *name;
+ (CUser *)shareInstance;

@end
