
//
//  WWDesignPatternViewController.m
//  WWDesignPattern
//
//  Created by 王永旺永旺 on 2017/11/18.
//  Copyright © 2017年 ITCoderW. All rights reserved.
//

#import "WWDesignPatternViewController.h"
#import "WWSingletonPattern.h"
#import <CoreMotion/CoreMotion.h>

@interface WWDesignPatternViewController ()

@end

@implementation WWDesignPatternViewController{
    CMMotionManager *_cmMotionManger;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self testSingleton];
    

}

#pragma mark - 测试单例
- (void)testSingleton{
 
    
//    [NSFileManager defaultManager];
//    [NSNotificationCenter defaultCenter];
    
    WWLog(@"%p---%p",[UIApplication sharedApplication],[UIApplication sharedApplication]);
    WWLog(@"%p---%p",[NSFileManager defaultManager],[NSFileManager defaultManager])
    WWLog(@"%p---%p",[NSNotificationCenter defaultCenter],[NSNotificationCenter defaultCenter]);
    WWLog(@"%p--%p",[UIAccelerometer sharedAccelerometer],[UIAccelerometer sharedAccelerometer]);
    WWLog(@"%p--%p",[CMMotionManager new],[CMMotionManager new]);
    
    
    
    WWSingletonPattern *singlePattern1 = [WWSingletonPattern new];
    WWSingletonPattern *singlePattern2 = [[WWSingletonPattern alloc]init];
    WWSingletonPattern *singlePattern3 = [WWSingletonPattern sharedInstance];
    WWSingletonPattern *singlePattern4 = [WWSingletonPattern sharedInstance];
    NSLog(@"%p---%p---%p--%p--%p---%p",singlePattern1,singlePattern2, singlePattern3,singlePattern4,[singlePattern4 copy],[singlePattern4 mutableCopy]);
    //    2017-11-18 20:35:38.532839+0800 WWDesignPattern[8382:562405] 0x60000000f080---0x60000000f080---0x60000000f080--0x60000000f080--0x60000000f080---0x60000000f080
    if (isARCWW) {
        WWLog(@"ARC");
    }else{
        WWLog(@"MRC");
    }

   
#if __has_feature(objc_arc)

#else
    [singlePattern1 retainCount];
    NSLog(@"%p--%p",singlePattern1,singlePattern2);
    [singlePattern2 release];
    NSLog(@"%zd",[singlePattern2 retainCount]);
    [singlePattern2 release];
    NSLog(@"%zd",[singlePattern2 retainCount]);
    [singlePattern2 release];
    NSLog(@"%zd",[singlePattern2 retainCount]);
    [singlePattern2 autorelease];
    NSLog(@"%p--%p",singlePattern2,[singlePattern2 autorelease]);
//    2017-11-18 21:35:03.603410+0800 WWDesignPattern[9227:628078] 0x600000006990---0x600000006990---0x600000006990--0x600000006990--0x600000006990---0x600000006990
//    2017-11-18 21:35:03.603628+0800 WWDesignPattern[9227:628078] 0x600000006990--0x600000006990
//    2017-11-18 21:35:03.603763+0800 WWDesignPattern[9227:628078] -1
//    2017-11-18 21:35:03.603865+0800 WWDesignPattern[9227:628078] -1
//    2017-11-18 21:35:03.604036+0800 WWDesignPattern[9227:628078] -1
//    2017-11-18 21:35:03.604200+0800 WWDesignPattern[9227:628078] 0x600000006990--0x600000006990
#endif
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
