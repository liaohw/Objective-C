# Objective-C
Objective-C 开发笔记

# 主要学习以下主题：
    1.OC类
    2.Foundation框架
    3.类目和协议
    4.内存管理
    5.对象拷贝与归档
    6.文件管理与读写
    7.KVC、KVO与谓词

# 笔记重点归类
## Foundation
### 基础
* NSString：字符串
* NSInteger、NSUInteger 

### 集合
* NSArray：数组，顺序存储，总不可存储基本数据类型，只能存放类的实例；需要把基础数据类型、结构体放入其中需要放入NSNumber\NSValue中进行封装
* NSSet：集合，hash无序，查找效率比NSArray高
* NSDictonary：字典

### 数据封装
* NSNumber：主要是用来封装ANSI C内置的数据，比如char，float，int，bool，（NSInteger是基础类型，NSNumber是一个类）
* NSValue：主要用来封装数据结构，包括系统（CGPoint/CGSize等）和自定义
* NSData：主要是提供一块原始数据的封装，方便数据的封装与流动，比较常见的是NSString／NSImage数据的封装与传递。在应用中，最常用于访问存储在文件中或者网络资源中的数据。

### 其他
* NSDate：日期、时间
* NSTimer ：定时器

`以上为不可变类型，其对可变类型如：NSMutableString 、NSMutableInteger 、NSMutableArray`

## 类目
使用类目，为现有的类NSString扩展方法，是新方法成为类的一部分，且子类也能继承
类目的不足:
* 类目还可以覆写现有类的方法。覆写后，原始方法则无法调用。
* 类目不能为类扩展实例属性。

## 协议和委托
* 协议仅仅声明方法，用作接口，本身并不实现，遵循该协议的类则负责具体实现。@protocol、@required、@required
* 委托是一种避免对复杂的UIKit对象（比如缺省的UIApplication对象）进行子类化的机制。在这种机制下，您可以不进行子类化和方法重载，而是将自己的定制代码放到委托对象中，从而避免对复杂对象进行修改。

比如：Student遵循_protocolDelegate协议，实现work方法；Student委托给Teacher，Teacher通过call_work使Student执行协议方法work

## 类属性
* @property与@synthesize配对使用，用来让编译器自动生成与数据成员同名的方法声明
* @property并不只是可以生成getter和setter方法，它还可以做内存管理

## 内存管理
* init\alloc\copy\retain之后需要有相互对应的release
* 其他方法获取一个对象（一般是autorelease）如arrayWithCapacity、arrayWithObjects是自动释放不需要release；

### 对象拷贝
    对象要具备复制功能，必须实现<NSCopying>协议或者<NSMutableCopying>协议，
    自定义对象实现协议的CopyWithZone方法/MutableCopyWithZone方法；
    常用的可复制对象有：NSString、NSMutableString、NSArray等；
拷贝方法：
* copy：产生对象的副本是不可变的
* mutableCopy：产生的对象的副本是可变的

浅拷贝和深拷贝：
* 浅拷贝值复制对象本身，对象里的属性、包含的对象不做复制（默认）
* 深拷贝则既复制对象本身，对象的属性也会复制一份

### 单例模式
重载实现类方法allocWithZone，（实现限制方法，限制这个类只能创建一个对象）

## 数据持久化 归档
* NSKeyedArchiver
* NSKeyedUnarchiver

## 文件管理
### 沙盒
路径：~资源库/Application Support/iPhone Simulator/文件夹
* Documents：程序中建立的或在程序中浏览到的文件数据保存在该目录下，iTunes备份和恢复的时候会包括此目录
* Library：系统文件，存储程序的默认设置或其它状态信息；Library/Caches：存放缓存文件，iTunes不会备份此目录，此目录下文件不会在应用退出删除
* tmp：临时文件的地方。App重启会被清空。

### 文件操作
* NSFileManager 是一个单例类 (全局的能被整个系统访问到）对文件进行管理的各种操作(遍历\创建\拷贝\移动\删除)
* ·NSFileHandle 操作系统返回给我们程序的文件指针,用NSData类型的二进制数据，对文件进行读写的









