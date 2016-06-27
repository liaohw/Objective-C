#import <Foundation/Foundation.h>

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