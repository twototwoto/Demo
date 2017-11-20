//
//  WWSingletonPattern.m
//  WWDesignPattern
//
//  Created by 王永旺永旺 on 2017/11/18.
//  Copyright © 2017年 ITCoderW. All rights reserved.
//

#import "WWSingletonPattern.h"

@implementation WWSingletonPattern


static WWSingletonPattern *sharedInstance = nil;

#if __has_feature(objc_arc)
//arc 环境下
//#pragma mark - 加锁的方式来创建单例
//+ (WWSingletonPattern *)sharedInstance{
//  static WWSingletonPattern *sharedInstance = nil;
//    @synchronized(self){
//        if (!sharedInstance) {
//            sharedInstance = [[self alloc]init];
//        }
//    }
//    return sharedInstance;
//}

//#pragma mark - GCD的方式创建单例
//+ (WWSingletonPattern *)sharedInstance{
//    static WWSingletonPattern *sharedInstance = nil;
//    static dispatch_once_t token;
//    dispatch_once(&token, ^{
//        sharedInstance = [[self alloc]init];
//    });
//    return sharedInstance;
//}

//#pragma mark - 单例
+ (WWSingletonPattern *)sharedInstance{
    return [[self alloc]init];
}

- (instancetype)init{
    if (self = [super init]) {
        
    }
    return self;
}

#pragma mark - GCD的方式创建单例
+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    //执行 alloc init后会调用allocWithZone；而new相当于alloc init的组合体
    if (!sharedInstance) {
        dispatch_once_t token = 0;
        dispatch_once(&token, ^{
            sharedInstance = [super allocWithZone:zone];
        });
    }
    return sharedInstance;
}
- (id)copy{
    return self;
}
- (id)mutableCopy{
    return self;
}
#else
//MRC 环境下
//#pragma mark - 单例
+ (WWSingletonPattern *)sharedInstance{
    return [[self alloc]init];
}

#pragma mark - GCD的方式创建单例
+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    //执行 alloc init后会调用allocWithZone；而new相当于alloc init的组合体
    if (!sharedInstance) {
        dispatch_once_t token = 0;
        dispatch_once(&token, ^{
            sharedInstance = [super allocWithZone:zone];
        });
    }
    return sharedInstance;
}
- (id)copy{
    return self;
}
- (id)mutableCopy{
    return self;
}

- (instancetype)retain{
    return self;
}

- (NSUInteger)retainCount{
    //表示不能释放的对象
    return NSUIntegerMax;
}

- (oneway void)release{
    //什么也不做
}

- (instancetype)autorelease{
    return self;
}

- (void)dealloc{
    [super dealloc];
}

#endif

@end
