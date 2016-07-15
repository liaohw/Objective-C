#import <Foundation/Foundation.h>

// _protocol协议继承NSObject协议
@protocol _protocol <NSObject>
@required
- (void)work;

@optional
- (void)drink;
- (void)eat;

@end

@interface Student : NSObject <_protocol>
- (void)study;
@end