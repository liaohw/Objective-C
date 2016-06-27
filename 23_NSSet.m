#import <Foundation/Foundation.h>

// 
int main(int argc, const char* argv[])
{
    NSString* user = @"john";
    NSString* user2 = @"jack";
    NSSet* set1 = [[NSSet alloc] initWithObjects:user,user2, nil];
    NSSet* set2 = [NSSet setWithObjects:user,user2, nil];

    NSArray* array = [[NSArray alloc] initWithObjects:user,user2,@"eva",nil];
    NSSet* set3 = [NSSet setWithArray:array];
    NSLog(@"set3 size : %d",[set3 count]);
    NSLog(@"set3 anyObject : %@",[set3 anyObject]);

    // NSMutableSet
    
	return 0;
}
