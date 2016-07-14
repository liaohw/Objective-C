#import <Foundation/Foundation.h>


@interface Engine : NSObject <NSCopying> {
    int horsepower; 
}
@end // Engine


@interface Car : NSObject <NSCopying> {
    NSString *name;
    Engine* engine;
    NSInteger price;
}
@property (readwrite, copy) NSString *name;
@property NSInteger price;
- (void) print;
@end // Car



@interface Garage : NSObject {
    NSString *name;
    NSMutableArray *cars;
}
@property (readwrite, copy) NSString *name;
- (void) addCar: (Car *) car;
- (void) print;
@end // Garage
