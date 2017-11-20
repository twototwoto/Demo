//
//  WWSingletonPattern.h
//  WWDesignPattern
//
//  Created by 王永旺永旺 on 2017/11/18.
//  Copyright © 2017年 ITCoderW. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 WW单例设计模式
 */
@interface WWSingletonPattern : NSObject

/**
 单例

 @return 返回单例
 */
+ (WWSingletonPattern *)sharedInstance;
@end
