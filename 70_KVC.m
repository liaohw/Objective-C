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
        price = 88888;
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
    desc = [NSString stringWithFormat: @"%@,    %@,    %d",
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
    NSLog(@"----------------KVC键值----------------------------");
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

    [garage addCar: makeCar (@"宝马", 88, 100000)];
    [garage addCar: makeCar (@"宝马", 99, 110000)];
    [garage addCar: makeCar (@"奔驰", 100, 200000)];
    [garage print];

    NSLog(@"----------------KVC运算----------------------------");
    //需要解析字符串路径，所以性能慢（左侧指定集合的运算）
    NSLog (@"cars.price min: %@", [garage valueForKeyPath: @"cars.@min.price"]);
    NSLog (@"cars.price max: %@", [garage valueForKeyPath: @"cars.@max.price"]);
    NSLog (@"cars.price sum: %@", [garage valueForKeyPath: @"cars.@sum.price"]);
    NSLog (@"cars.price avg: %.2f", [[garage valueForKeyPath: @"cars.@avg.price"] floatValue]);
    NSArray *keyName = [garage valueForKeyPath: @"cars.@distinctUnionOfObjects.name"];
    for(NSString* _s in keyName){
        NSLog(@"cars.distinct : %@",_s);    
    }

    NSLog(@"----------------KVC批处理----------------------------");
    NSArray *keys = [NSArray arrayWithObjects: @"name", @"price",nil];
    NSDictionary *carValues = [car dictionaryWithValuesForKeys: keys];
    NSLog (@"ValuesForKeys : %@", carValues);

    NSDictionary *newValues = [NSDictionary dictionaryWithObjectsAndKeys:
        @"大众", @"name",
        [[Engine alloc] init], @"engine",
        [NSNumber numberWithInt:66666], @"price",
        nil];
    [car setValuesForKeysWithDictionary: newValues];
    NSLog (@"ObjectsAndKeys : %@", car);
    [car setValue:[NSNull null] forKey: @"name"];   //[NSNull null] => <null> 表示NSNull对象
    [car setValue:nil forKey: @"engine"];           //nil => (null) 表示nil值
    NSLog (@"setValue/forKey : %@", car);

    NSLog(@"----------------NSPredicate谓词----------------------------");
    NSPredicate *predicate;
    predicate = [NSPredicate predicateWithFormat: @"name == 'polo car'"];
    NSLog (@"name == 'polo car'：%s", ([predicate evaluateWithObject: car]) ? "YES" : "NO");
    predicate = [NSPredicate predicateWithFormat: @"price == 66666"];
    NSLog (@"price == 66666：%s", ([predicate evaluateWithObject: car]) ? "YES" : "NO");

    predicate = [NSPredicate predicateWithFormat: @"price > 100 and engine.horsepower > 90"];
    NSArray *results = [garage->cars filteredArrayUsingPredicate: predicate];
    for(Car* _s in results){
        NSLog(@"cars.filtered : %@",_s);    
    }

    [autoreleasePool release];
    return 0;
}


 // ----------------KVC键值----------------------------
 // name:Mini Car,price:88888
 // valueForKey'name : Mini Car
 // valueForKey'name : polo car
 // valueForKeyPath'engine.horsepower : 1001
 // ----------------KVC----------------------------
 // HangZhou's Garage:
 //     宝马,    HP:88,    100000
 //     宝马,    HP:99,    110000
 //     奔驰,    HP:100,    200000
 // ----------------KVC运算----------------------------
 // cars.price min: 100000
 // cars.price max: 200000
 // cars.price sum: 410000
 // cars.price avg: 136666.67
 // cars.distinct : 奔驰
 // cars.distinct : 宝马
 // ----------------KVC批处理----------------------------
 // ValuesForKeys : {name = "polo car"; price = 88888; }
 // ObjectsAndKeys : 大众,    HP:999,    66666
 // setValue/forKey : <null>,    (null),    66666
 // ----------------KVC未定义键值----------------------------