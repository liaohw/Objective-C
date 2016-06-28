//
//  41_Property.h
//  41_Property
//
//  Created by liaohw on 16/6/27.
//  Copyright © 2016年 Asiainfo.com. All rights reserved.
//

#ifndef main_h
#define main_h

@interface CUser : NSObject {
}

//readonly： 不生成set方法， 只有get方法

@property (nonatomic,copy,readwrite)NSString *name;  //注意括号里面的参数

- (void)showInfo;

@end

#endif /* main_h */
