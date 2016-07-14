#import <Foundation/Foundation.h>
#import "70_KVC.h"


@implementation Engine
- (id) init {
    if (self = [super init]) {
        horsepower = 999;
    }
    return (self);
} // init

- (id) copyWithZone: (NSZone *) zone
{
    Engine *engineCopy;
    engineCopy = [[[self class] allocWithZone: zone] init];
    [engineCopy setValue: [NSNumber numberWithInt: horsepower] forKey: @"horsepower"];
    
    return (engineCopy);
} // copyWithZone
- (NSString *) description
{
    NSString *description;
    description = [NSString stringWithFormat:@"HP:%d", horsepower];
    return (description);
} // description
@end // Engine




@implementation Car

@synthesize name;
@synthesize price;

- (id) init
{
    if (self = [super init]) {
        self.name = @"Mini Car";
        engine = [[Engine alloc] init];
        price = 88;
    }
    return (self);
} // init

- (id) copyWithZone: (NSZone *) zone
{
    Car *carCopy = [[[self class] allocWithZone: zone] init];
    carCopy.name = name;
    return (carCopy);    
} // copyWithZone

- (void) dealloc
{
    self.name = nil;
    [super dealloc];
} // dealloc

- (void) print
{
    NSLog (@"name:%@,price:%d", name,price);
} // print

- (NSString *) description {
    NSString *desc;
    desc = [NSString stringWithFormat: @"%@ %@  %d",
            name, engine, price];
    return desc;
} // description
@end // Car


@implementation Garage

@synthesize name;

- (void) addCar: (Car *) car {
    if (cars == nil) {
        cars = [[NSMutableArray alloc] init];
    }
    [cars addObject: car];
} // addCar

- (void) dealloc {
    [name release];
    [cars release];
    [super dealloc];
} // dealloc

- (void) print {
    NSLog (@"%@:", name);
    for (Car *car in cars) {
        NSLog (@"    %@", car);
    }
} // print
@end  // Garage


Car *makeCar (NSString *name, int horsepower,NSInteger price) {
    Car *car = [[[Car alloc] init] autorelease];
    car.name = name;
    [car setValue:[NSNumber numberWithInt: horsepower] forKeyPath: @"engine.horsepower"];
    car.price = price;

    return (car);
} // makeCar

// KVC : key value coding
int main(int argc, const char* argv[])
{
    NSAutoreleasePool *autoreleasePool = [[NSAutoreleasePool alloc] init];  
    NSLog(@"----------------KVC----------------------------");
    Car *car = [[Car alloc] init];
    [car print];

    NSLog (@"valueForKey'name : %@", [car valueForKey:@"name"]);
    // valueForKey
    [car setValue:@"polo car" forKey: @"name"];
    NSLog (@"valueForKey'name : %@", [car valueForKey:@"name"]);
    // valueForKeyPath
    [car setValue:[NSNumber numberWithInt: 1001] forKeyPath: @"engine.horsepower"];
    NSLog (@"valueForKeyPath'engine.horsepower : %@", [car valueForKeyPath:@"engine.horsepower"]);

    NSLog(@"----------------KVC----------------------------");
    Garage *garage = [[Garage alloc] init];
    garage.name = @"HangZhou's Garage";

    [garage addCar: makeCar (@"宝马", 99, 110000)];
    [garage addCar: makeCar (@"奔驰", 100, 200000)];
    [garage addCar: makeCar (@"现代", 88, 100000)];
    [garage print];

    [autoreleasePool release];
    return 0;
}
