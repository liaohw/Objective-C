#import <Foundation/Foundation.h>

// 不可变字典(NSDictonary)

int main(int argc, const char* argv[])
{
    NSArray *array1 = [NSArray arrayWithObjects:@"ar10",@"ar11", nil];
    NSArray *array2 = [NSArray arrayWithObjects:@"ar20",@"ar21", nil];
    
    NSDictionary *dic1 = [[NSDictionary alloc] initWithObjectsAndKeys:array1,@"key1",array2,@"key2", nil];
    NSLog(@"1.count:%ld",[dic1 count]);
  
    NSDictionary *dic2 = [NSDictionary dictionaryWithObjectsAndKeys:array1,@"key11",array2,@"key22", nil];
    
    NSArray *allkeys = [dic1 allKeys];
    NSLog(@"2.allkeys:%@",allkeys);
    
    NSArray *allvalues = [dic1 allValues];
    NSLog(@"3.allvalues:%@",allvalues);
    
    NSArray *array3 = [dic1 objectForKey:@"key1"];
    NSLog(@"4.key1:%@",array3);

	/*________________________可变字典(NSMutableDictionary)___________________________*/

    NSMutableDictionary *mdic1 = [[NSMutableDictionary alloc] initWithCapacity:3];
    [mdic1 setObject:array1 forKey:@"m_key"];
    [mdic1 setObject:array2 forKey:@"m_key2"];
    [mdic1 addEntriesFromDictionary:dic1];  //注意：相同的key是不能重复添加到字典中
    
    NSLog(@"5.mdic1:%@",mdic1);
    for (NSString *name in mdic1) {
        NSString *score = [mdic1 objectForKey:name];
        NSLog(@"6.name:%@,score:%@",name,score);
    }
    
	return 0;
}


// 2016-06-24 17:55:35.176 NSDictionary[7308] 1.count:2
// 2016-06-24 17:55:35.177 NSDictionary[7308] 2.allkeys:(key2, key1)
// 2016-06-24 17:55:35.177 NSDictionary[7308] 3.allvalues:((ar20, ar21), (ar10, ar11))
// 2016-06-24 17:55:35.177 NSDictionary[7308] 4.key1:(ar10, ar11)
// 2016-06-24 17:55:35.178 NSDictionary[7308] 5.mdic1:{key1 = (ar10, ar11); key2 = (ar20, ar21); "m_key" = (ar10, ar11); "m_key2" = (ar20, ar21); }
// 2016-06-24 17:55:35.178 NSDictionary[7308] 6.name:m_key,score:(ar10, ar11)
// 2016-06-24 17:55:35.178 NSDictionary[7308] 6.name:key1,score:(ar10, ar11)
// 2016-06-24 17:55:35.178 NSDictionary[7308] 6.name:key2,score:(ar20, ar21)
// 2016-06-24 17:55:35.178 NSDictionary[7308] 6.name:m_key2,score:(ar20, ar21)
