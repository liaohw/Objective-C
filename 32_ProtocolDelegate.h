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

// Student遵循_protocolDelegate协议，实现work方法
// Student委托给Teacher，Teacher通过call_work使Student执行协议方法work
@interface Teacher : NSObject{
    id<_protocolDelegate> _delegate;
}
- (id)initWithDelegate:(id<_protocolDelegate>)delegate;
- (void)call_work;
@end

// 每个iPhone应用程序都必须有应用程序委托对象，它可以是您希望的任何类的实例，但需要遵循UIApplicationDelegate协议，该协议的方法定义了应用程序生命周期中的某些挂钩，您可以通过这些方法来实现定制的行为。虽然您不需要实现所有的方法，但是每个应用程序委托都应该实现“处理关键的应用程序任务”部分中描述的方法。