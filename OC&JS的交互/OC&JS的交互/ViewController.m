//
//  ViewController.m
//  OC&JS的交互
//
//  Created by 王永旺永旺 on 2016/12/14.
//  Copyright © 2016年 ITCoderW. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadWebView];
    //关闭webView的弹簧效果
    self.webView.scrollView.bounces = NO;
    

}

- (void)loadWebView{
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.dianping.com/tuan/deal/66666"]]];
    ;
    
    
}



@end
