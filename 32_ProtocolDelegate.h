#import <Foundation/Foundation.h>

@protocol _protocolDelegate <NSObject>
@required
- (NSInteger)work;
@end


@interface Student : NSObject<_protocolDelegate> {
	NSInteger _times;
}
- (id)initWithTimes:(NSInteger)times;
@end


@interface Teacher : NSObject{
    id<_protocolDelegate> _delegate;
}
- (id)initWithDelegate:(id<_protocolDelegate>)delegate;
- (void)call_work;
@end